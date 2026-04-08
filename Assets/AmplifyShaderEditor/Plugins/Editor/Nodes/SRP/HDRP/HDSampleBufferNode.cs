// Amplify Shader Eitor - Visual Shader Editing Tool
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;
using System.Linq;
using System.Collections.Generic;
using UnityEditor;

namespace AmplifyShaderEditor
{
	using UnityEngine;

	[Serializable]
	[NodeAttributes( "HD Sample Buffer", "Miscellaneous", "HD Sample Buffer samples a buffer directly from the Camera. Only available on HDRP." )]
	public sealed class HDSampleBufferNode : ParentNode
	{
		private enum SourceBufferOption
		{
			NormalWS = 0,
			Smoothness,
			MotionVectors,
			IsSky,
			PostProcessInput,
			RenderingLayerMask,
			Thickness,
			IsUnderWater
			// @diogo: add new ones at the bottom to ensure unique id
		}

		[SerializeField]
		private SourceBufferOption m_sourceBuffer = SourceBufferOption.NormalWS;

		private const string HDSampleBufferTitle = "HD Sample Buffer";
		private const string SourceBufferLabel = "Source Buffer";

		private const string ErrorOnCompilationMsg = "Attempting to use HDRP specific node on incorrect SRP or Builtin RP.";
		private const string NodeVersionErrorMsg = "This node requires Unity 2022.3/HDRP v14 or higher";
		private const string NodeSRPErrorMsg = "Only valid on HDRP";

		private class SourceBufferConfig
		{
			public string optionName = string.Empty;

			public bool output0Visible = true;
			public string output0Label = Constants.EmptyPortValue;
			public WirePortDataType output0Format = WirePortDataType.FLOAT;
			public string output0Modifier = "{0}";

			public bool output1Visible = false;
			public string output1Label = Constants.EmptyPortValue;
			public WirePortDataType output1Format;
			public string output1Modifier = "{0}";

			public bool input0Visible = true;
			public string input0Label = "UV";
			public WirePortDataType input0Format = WirePortDataType.FLOAT2;

			public bool input1Visible = false;
			public string input1Label = "Layer Mask";
			public WirePortDataType input1Format = WirePortDataType.FLOAT;

			public string[] function;
			public WirePortDataType functionReturnFormat = WirePortDataType.FLOAT;
		}

		private static readonly Dictionary<SourceBufferOption, SourceBufferConfig> SourceBufferToConfig = new Dictionary<SourceBufferOption, SourceBufferConfig>
		{
			// HDRP 14+
			{ SourceBufferOption.NormalWS, new SourceBufferConfig() {
					optionName = "Normal WS",
					output0Label = "Normal WS",
					output0Format = WirePortDataType.FLOAT3,
					function =  new string[]
					{
						"float3 HDSampleBuffer_NormalWS( float2 uv, int layerID = 0 )\n",
						"{\n",
							"\tuint2 pixelCoords = uint2( uv * _ScreenSize.xy );\n",
							"\tNormalData normalData;\n",
							"\tDecodeFromNormalBuffer( pixelCoords, normalData );\n",
							"\treturn normalData.normalWS;\n",
						"}\n"
					},
					functionReturnFormat = WirePortDataType.FLOAT3
			} },

			{ SourceBufferOption.Smoothness, new SourceBufferConfig() {
					optionName = "Smoothness",
					output0Label = "Smoothness",
					output0Format = WirePortDataType.FLOAT,
					function =  new string[]
					{
						"float HDSampleBuffer_Smoothness( float2 uv, int layerID = 0 )\n",
						"{\n",
							"\tuint2 pixelCoords = uint2( uv * _ScreenSize.xy );\n",
							"\tNormalData normalData;\n",
							"\tDecodeFromNormalBuffer( pixelCoords, normalData );\n",
							"\treturn IsSky( pixelCoords ) ? 1 : RoughnessToPerceptualSmoothness( PerceptualRoughnessToRoughness( normalData.perceptualRoughness ) );\n",
						"}\n"
					}
			} },

			{ SourceBufferOption.MotionVectors, new SourceBufferConfig() {
					optionName = "Motion Vectors",
					output0Label = "Motion Vectors",
					output0Format = WirePortDataType.FLOAT2,
					function =  new string[]
					{
						"float2 HDSampleBuffer_MotionVectors( float2 uv, int layerID = 0 )\n",
						"{\n",
							"\tuint2 pixelCoords = uint2( uv * _ScreenSize.xy );\n",
							"\tfloat4 motionVecBufferSample = LOAD_TEXTURE2D_X_LOD( _CameraMotionVectorsTexture, pixelCoords, 0 );\n",
							"\tfloat2 motionVec;\n",
							"\tDecodeMotionVector( motionVecBufferSample, motionVec );\n",
							"\treturn motionVec;\n",
						"}\n"
					},
					functionReturnFormat = WirePortDataType.FLOAT2
			} },

			{ SourceBufferOption.IsSky, new SourceBufferConfig() {
					optionName = "Is Sky",
					output0Label = "Is Sky",
					output0Format = WirePortDataType.FLOAT,
					function =  new string[]
					{
						"float HDSampleBuffer_IsSky( float2 uv, int layerID = 0 )\n",
						"{\n",
							"\treturn IsSky( uv ) ? 1 : 0;\n",
						"}\n"
					}
			} },

			{ SourceBufferOption.PostProcessInput, new SourceBufferConfig() {
					optionName = "Post Process Input",
					output0Label = "Post Process Input",
					output0Format = WirePortDataType.FLOAT4,
					function =  new string[]
					{
						"float4 HDSampleBuffer_PostProcessInput( float2 uv, int layerID = 0 )\n",
						"{\n",
						"\tuint2 pixelCoords = uint2( uv * _ScreenSize.xy );\n",
						"\treturn LOAD_TEXTURE2D_X_LOD( _CustomPostProcessInput, pixelCoords, 0 );\n",
						"}\n"
					},
					functionReturnFormat = WirePortDataType.FLOAT4
			} },

			// HDRP 17+
			{ SourceBufferOption.RenderingLayerMask, new SourceBufferConfig() {
					optionName = "Rendering Layer Mask",
					output0Label = "Rendering Layer Mask",
					output0Format = WirePortDataType.FLOAT,
					function =  new string[]
					{
						"float HDSampleBuffer_RenderingLayerMask( float2 uv, int layerID = 0 )\n",
						"{\n",
							"\tuint2 pixelCoords = uint2( uv * _ScreenSize.xy );\n",
							"\treturn _EnableRenderingLayers ? UnpackMeshRenderingLayerMask( LOAD_TEXTURE2D_X_LOD( _RenderingLayerMaskTexture, pixelCoords, 0 ) ) : 0;\n",
						"}\n",
					}
			} },

			{ SourceBufferOption.Thickness, new SourceBufferConfig() {
					optionName = "Thickness",
					output0Label = "Thickness",
					output0Format = WirePortDataType.FLOAT,
					output0Modifier = "( {0}.x )",
					output1Visible = true,
					output1Label = "Overlap Count",
					output1Format = WirePortDataType.FLOAT,
					output1Modifier = "( {0}.y )",
					input1Visible = true,
					function =  new string[]
					{
						"float2 HDSampleBuffer_Thickness( float2 uv, int layerID = 0 )\n",
						"{\n",
							"\t#if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)\n",
							"\t#error 'HD Sample Buffer' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword\n",
							"\t#endif\n",
							"\treturn SampleThickness( uv.xy, layerID );\n",
						"}\n"
					},
					functionReturnFormat = WirePortDataType.FLOAT2
			} },

			{ SourceBufferOption.IsUnderWater, new SourceBufferConfig() {
					optionName = "Is Under Water",
					output0Label = "Is Under Water",
					output0Format = WirePortDataType.FLOAT,
					output0Modifier = "( {0} <= 0.0 )",
					output1Visible = true,
					output1Label = "Distance",
					output1Format = WirePortDataType.FLOAT,
					function =  new string[]
					{
						"float HDSampleBuffer_IsUnderWater( float2 uv, int layerID = 0 )\n",
						"{\n",
							"\tuint2 pixelCoords = uint2( uv * _ScreenSize.xy );\n",
							"\treturn _UnderWaterSurfaceIndex != -1 ? GetUnderWaterDistance( pixelCoords ) : 1.0f;\n",
						"}\n"
					}
			} },
		};

		// HDRP 14+
		private static readonly SourceBufferOption[] SourceBufferOptions14p =
		{
			SourceBufferOption.NormalWS,
			SourceBufferOption.Smoothness,
			SourceBufferOption.MotionVectors,
			SourceBufferOption.IsSky,
			SourceBufferOption.PostProcessInput
		};

		// HDRP 17+
		private static readonly SourceBufferOption[] SourceBufferOptions17p =
		{
			SourceBufferOption.NormalWS,
			SourceBufferOption.Smoothness,
			SourceBufferOption.MotionVectors,
			SourceBufferOption.IsSky,
			SourceBufferOption.PostProcessInput,
			SourceBufferOption.RenderingLayerMask,
			SourceBufferOption.Thickness,
			SourceBufferOption.IsUnderWater,
		};

		private string[] m_sourceBufferOptions;
		private string[] SourceBufferOptions { get { return m_sourceBufferOptions = ( m_sourceBufferOptions == null ) ? UpdateOptions() : m_sourceBufferOptions; } }

		protected override void CommonInit( int uniqueId )
		{
			base.CommonInit( uniqueId );
			AddInputPort( WirePortDataType.FLOAT2, false, "UV" );
			AddInputPort( WirePortDataType.INT, false, "Layer Mask" );
			AddOutputPort( WirePortDataType.FLOAT, Constants.EmptyPortValue );
			AddOutputPort( WirePortDataType.FLOAT, Constants.EmptyPortValue );

			m_inputPorts[ 1 ].Visible = false;
			m_outputPorts[ 1 ].Visible = false;

			m_errorMessageTooltip = "";
			m_errorMessageTypeIsError = NodeMessageType.Error;
			m_autoWrapProperties = true;

			UpdatePorts();
		}

		private static string[] UpdateOptions()
		{
			var optionsByVersion = new SourceBufferOption[ 0 ];
			if ( ASEPackageManagerHelper.PackageSRPVersion >= ( int )ASESRPBaseline.ASE_SRP_17_0 )
			{
				optionsByVersion = SourceBufferOptions17p;
			}
			else
			{
				optionsByVersion = SourceBufferOptions14p;
			}

			var options = new List<string>();
			foreach ( SourceBufferOption option in optionsByVersion )
			{
				options.Add( SourceBufferToConfig[ option ].optionName );
			}
			return options.ToArray();
		}

		private void UpdatePorts()
		{
			SourceBufferConfig config = SourceBufferToConfig[ m_sourceBuffer ];

			m_outputPorts[ 0 ].ChangeProperties( config.output0Label, config.output0Format, false );
			m_outputPorts[ 1 ].ChangeProperties( config.output1Label, config.output1Format, false );
			m_outputPorts[ 1 ].Visible = config.output1Visible;

			m_inputPorts[ 0 ].ChangeProperties( config.input0Label, config.input0Format, false );
			m_inputPorts[ 1 ].ChangeProperties( config.input1Label, config.input1Format, false );
			m_inputPorts[ 1 ].Visible = config.input1Visible;
		}

		public override void DrawProperties()
		{
			base.DrawProperties();

			EditorGUI.BeginChangeCheck();
			m_sourceBuffer = ( SourceBufferOption )EditorGUILayoutPopup( SourceBufferLabel, ( int )m_sourceBuffer, SourceBufferOptions );
			if ( EditorGUI.EndChangeCheck() )
			{
				UpdatePorts();
			}

			if( m_showErrorMessage )
			{
				EditorGUILayout.HelpBox( m_errorMessageTooltip , MessageType.Error );
			}
		}

		// @diogo: disable subtitle for now, because we're using the option name as output0 name
		public override void DrawTitle( Rect titlePos )
		{
			const string subTitleFormat = "Source( {0} )";
			SetAdditonalTitleTextOnCallback( SourceBufferToConfig[ m_sourceBuffer ].optionName, subTitleFormat, ( instance, newSubTitle ) => instance.AdditonalTitleContent.text = string.Format( subTitleFormat, newSubTitle ) );

			if ( ContainerGraph.LodLevel <= ParentGraph.NodeLOD.LOD3 )
			{
				GUI.Label( titlePos, HDSampleBufferTitle, UIUtils.GetCustomStyle( CustomStyle.NodeTitle ) );
			}
		}

		public override string GenerateShaderForOutput( int outputId, ref MasterNodeDataCollector dataCollector, bool ignoreLocalvar )
		{
			if ( !dataCollector.IsSRP || !dataCollector.TemplateDataCollectorInstance.IsHDRP )
			{
				UIUtils.ShowMessage( ErrorOnCompilationMsg , MessageSeverity.Error );
				return GenerateErrorValue();
			}

			if ( !m_outputPorts[ outputId ].IsLocalValue( dataCollector.PortCategory ) )
			{
				SourceBufferConfig source = SourceBufferToConfig[ m_sourceBuffer ];

				string sourceBufferName = m_sourceBuffer.ToString();
				string outputPortName = ( string.IsNullOrWhiteSpace( m_outputPorts[ outputId ].Name ) ? sourceBufferName : m_outputPorts[ outputId ].Name );
				outputPortName = new string( outputPortName.Where( c => !char.IsWhiteSpace( c ) ).ToArray() );

				string uv = m_inputPorts[ 0 ].GeneratePortInstructions( ref dataCollector );
				string layerID = m_inputPorts[ 1 ].GeneratePortInstructions( ref dataCollector );

				string sourceBufferCall = string.Format( "HDSampleBuffer_{0}( {1}, {2} )", sourceBufferName, uv, layerID );
				string outputModifier = ( outputId == 0 ) ? source.output0Modifier : source.output1Modifier;

				string sampleVarName = string.Format( "hdSampleBuffer_{0}{1}_Values", sourceBufferName, OutputId );
				string sampleVarValue = sourceBufferCall;

				string outputVarName = string.Format( "hdSampleBuffer_{0}{1}", outputPortName, OutputId );
				string outputVarValue = string.Format( outputModifier, sampleVarName );

				if ( m_sourceBuffer == SourceBufferOption.PostProcessInput )
				{
					dataCollector.AddToUniforms( -1, "TEXTURE2D_X( _CustomPostProcessInput );" );
				}
				else if ( m_sourceBuffer == SourceBufferOption.NormalWS || m_sourceBuffer == SourceBufferOption.Smoothness )
				{
					dataCollector.AddToIncludes( UniqueId, "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/NormalBuffer.hlsl" );
				}

				dataCollector.AddFunction( source.function[ 0 ], source.function, false );

				dataCollector.AddLocalVariable( UniqueId, CurrentPrecisionType, source.functionReturnFormat, sampleVarName, sampleVarValue );
				dataCollector.AddLocalVariable( UniqueId, CurrentPrecisionType, m_outputPorts[ outputId ].DataType, outputVarName, outputVarValue );

				m_outputPorts[ outputId ].SetLocalValue( outputVarName, dataCollector.PortCategory );
				return outputVarName;
			}
			return m_outputPorts[ outputId ].LocalValue( dataCollector.PortCategory );
		}

		public override void OnNodeLogicUpdate( DrawInfo drawInfo )
		{
			base.OnNodeLogicUpdate( drawInfo );

			bool isHDRP = ( ContainerGraph.CurrentCanvasMode == NodeAvailability.TemplateShader && ContainerGraph.CurrentSRPType == TemplateSRPType.HDRP );
			bool isWrongHDRP = isHDRP && ( ASEPackageManagerHelper.PackageSRPVersion < ( int )ASESRPBaseline.ASE_SRP_14_X );

			m_showErrorMessage = ( ContainerGraph.CurrentCanvasMode == NodeAvailability.SurfaceShader ) ||
								 ( ContainerGraph.CurrentCanvasMode == NodeAvailability.TemplateShader && ContainerGraph.CurrentSRPType != TemplateSRPType.HDRP ) ||
								 isWrongHDRP;

			if ( m_showErrorMessage )
			{
				if ( isWrongHDRP )
				{
					m_errorMessageTooltip = NodeVersionErrorMsg;
				}
				else
				{
					m_errorMessageTooltip = NodeSRPErrorMsg;
				}
			}
		}

		public override void ReadFromString( ref string[] nodeParams )
		{
			base.ReadFromString( ref nodeParams );
			Enum.TryParse<SourceBufferOption>( GetCurrentParam( ref nodeParams ), out m_sourceBuffer );
			UpdatePorts();
		}

		public override void WriteToString( ref string nodeInfo, ref string connectionsInfo )
		{
			base.WriteToString( ref nodeInfo, ref connectionsInfo );
			IOUtils.AddFieldValueToString( ref nodeInfo, m_sourceBuffer );
		}
	}
}
//#endif
