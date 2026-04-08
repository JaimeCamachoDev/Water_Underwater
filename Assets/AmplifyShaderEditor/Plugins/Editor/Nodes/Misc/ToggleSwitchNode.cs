// Amplify Shader Editor - Visual Shader Editing Tool
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;
using UnityEditor;
using UnityEngine;

namespace AmplifyShaderEditor
{
	[Serializable]
	[NodeAttributes( "Toggle Switch", "Logical Operators", "Switch between any of its input ports" )]
	public class ToggleSwitchNode : PropertyNode
	{
		public enum ToggleSwitchVariableMode
		{
			Create = 0,
			Reference = 1
		}

		private float InstanceIconWidth = 19;
		private float InstanceIconHeight = 19;
		private readonly Color ReferenceHeaderColor = new Color( 0f, 0.5f, 0.585f, 1.0f );

		private const string ToggleSwitchStr = "Toggle Switch";
		private const string ModeStr = "Mode";

		private const string InputPortName = "In ";
		private const string CurrSelectedStr = "Toggle Value";

		private const string AssignKeywordStr = "Assign Keyword";
		private const string AssignKeywordInfoStr = "The material inspector will assign a {0}_ON keyword when the toggle is turned ON. " +
			"To use it, you'll need a Switch node to create the keyword variants";

		//private const string LerpOp = "lerp({0},{1},{2})";
		private const string LerpOp = "(( {2} )?( {1} ):( {0} ))";

		[SerializeField]
		private string[] AvailableInputsLabels = { "In 0", "In 1" };

		[SerializeField]
		private int[] AvailableInputsValues = { 0, 1 };

		[SerializeField]
		private int m_currentSelectedInput = 0;

		[SerializeField]
		private WirePortDataType m_mainDataType = WirePortDataType.FLOAT;

		[SerializeField]
		private bool m_assignKeyword = true;

		[SerializeField]
		private ToggleSwitchVariableMode m_toggleSwitchVarMode = ToggleSwitchVariableMode.Create;

		[SerializeField]
		private ToggleSwitchNode m_reference = null;

		[SerializeField]
		private int m_referenceArrayId = -1;

		[SerializeField]
		private int m_referenceNodeId = -1;

		private bool m_isToggleSwitchDirty = false;

		private Rect m_iconPos;

		private int m_cachedPropertyId = -1;

		private GUIContent m_popContent;

		private Rect m_varRect;
		private Rect m_imgRect;
		private bool m_editing;

		protected override void CommonInit( int uniqueId )
		{
			base.CommonInit( uniqueId );
			AddInputPort( m_mainDataType, false, InputPortName + "0" );
			AddInputPort( m_mainDataType, false, InputPortName + "1" );

			AddOutputPort( m_mainDataType, " " );
			m_insideSize.Set( 80, 25 );
			m_currentParameterType = PropertyType.Property;
			m_customPrefix = "Toggle Switch";

			m_popContent = new GUIContent();
			m_popContent.image = UIUtils.PopupIcon;

			m_availableAttribs.Clear();
			//Need to maintain this because of retrocompatibility reasons
			m_availableAttribs.Add( new PropertyAttributes( "Toggle", "[Toggle]" ) );

			m_drawAttributes = false;
			m_freeType = false;
			m_useVarSubtitle = true;
			m_showTitleWhenNotEditing = false;
			m_useInternalPortData = true;
			m_previewShaderGUID = "beeb138daeb592a4887454f81dba2b3f";

			m_allowPropertyDuplicates = true;
			m_showAutoRegisterUI = false;

			m_srpBatcherCompatible = true;
		}

		protected override void OnUniqueIDAssigned()
		{
			base.OnUniqueIDAssigned();
			UIUtils.RegisterPropertyNode( this );

			if( CurrentVarMode != ToggleSwitchVariableMode.Reference )
			{
				ContainerGraph.ToggleSwitchNodes.AddNode( this );
			}

			if( UniqueId > -1 )
			{
				ContainerGraph.ToggleSwitchNodes.OnReorderEventComplete += OnReorderEventComplete;
			}
		}

		public override void Destroy()
		{
			base.Destroy();
			UIUtils.UnregisterPropertyNode( this );
			if( CurrentVarMode != ToggleSwitchVariableMode.Reference )
			{
				ContainerGraph.ToggleSwitchNodes.RemoveNode( this );
			}

			if( UniqueId > -1 )
				ContainerGraph.ToggleSwitchNodes.OnReorderEventComplete -= OnReorderEventComplete;
		}

		void OnReorderEventComplete()
		{
			if( CurrentVarMode == ToggleSwitchVariableMode.Reference )
			{
				if( m_reference != null )
				{
					m_referenceArrayId = ContainerGraph.ToggleSwitchNodes.GetNodeRegisterIdx( m_reference.UniqueId );
				}
			}
		}

		public override void SetPreviewInputs()
		{
			base.SetPreviewInputs();

			if ( m_cachedPropertyId == -1 )
				m_cachedPropertyId = Shader.PropertyToID( "_Current" );

			ToggleSwitchNode node = ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference && m_reference != null ) ? m_reference : this;

			PreviewMaterial.SetInt( m_cachedPropertyId, node.m_currentSelectedInput );
		}

		public override void OnConnectedOutputNodeChanges( int portId, int otherNodeId, int otherPortId, string name, WirePortDataType type )
		{
			base.OnConnectedOutputNodeChanges( portId, otherNodeId, otherPortId, name, type );
			UpdateConnection();
		}

		public override void OnInputPortConnected( int portId, int otherNodeId, int otherPortId, bool activateNode = true )
		{
			base.OnInputPortConnected( portId, otherNodeId, otherPortId, activateNode );
			UpdateConnection();
		}

		public override void OnInputPortDisconnected( int portId )
		{
			base.OnInputPortDisconnected( portId );
			UpdateConnection();
		}

		void UpdateConnection()
		{
			WirePortDataType type1 = WirePortDataType.FLOAT;
			if( m_inputPorts[ 0 ].IsConnected )
				type1 = m_inputPorts[ 0 ].GetOutputConnection( 0 ).DataType;

			WirePortDataType type2 = WirePortDataType.FLOAT;
			if( m_inputPorts[ 1 ].IsConnected )
				type2 = m_inputPorts[ 1 ].GetOutputConnection( 0 ).DataType;

			m_mainDataType = UIUtils.GetPriority( type1 ) > UIUtils.GetPriority( type2 ) ? type1 : type2;

			m_inputPorts[ 0 ].ChangeType( m_mainDataType, false );
			m_inputPorts[ 1 ].ChangeType( m_mainDataType, false );


			//m_outputPorts[ 0 ].ChangeProperties( m_out, m_mainDataType, false );
			m_outputPorts[ 0 ].ChangeType( m_mainDataType, false );
		}

		public override void OnNodeLayout( DrawInfo drawInfo, NodeUpdateCache cache )
		{
			base.OnNodeLayout( drawInfo, cache );

			m_varRect = m_remainingBox;
			m_varRect.width = 50 * drawInfo.InvertedZoom;
			m_varRect.height = 16 * drawInfo.InvertedZoom;
			m_varRect.x = m_remainingBox.xMax - m_varRect.width;
			m_varRect.y += 1 * drawInfo.InvertedZoom;

			m_imgRect = m_varRect;
			m_imgRect.x = m_varRect.xMax - 16 * drawInfo.InvertedZoom;
			m_imgRect.width = 16 * drawInfo.InvertedZoom;
			m_imgRect.height = m_imgRect.width;

			CheckReferenceValues( false );

			if ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference )
			{
				m_iconPos = m_globalPosition;
				m_iconPos.width = InstanceIconWidth * drawInfo.InvertedZoom;
				m_iconPos.height = InstanceIconHeight * drawInfo.InvertedZoom;

				m_iconPos.y += 10 * drawInfo.InvertedZoom;
				m_iconPos.x += /*m_globalPosition.width - m_iconPos.width - */5 * drawInfo.InvertedZoom;
			}
		}

		void CheckReferenceValues( bool forceUpdate )
		{
			if ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference )
			{
				if ( m_reference == null && m_referenceNodeId > 0 )
				{
					m_reference = ContainerGraph.GetNode( m_referenceNodeId ) as ToggleSwitchNode;
					m_referenceArrayId = ContainerGraph.ToggleSwitchNodes.GetNodeRegisterIdx( m_referenceNodeId );
				}

				if ( m_reference != null )
				{
					if ( forceUpdate || m_reference.IsToggleSwitchDirty )
					{
						int count = m_inputPorts.Count;
						for ( int i = 0; i < count; i++ )
						{
							m_inputPorts[ i ].Name = m_reference.InputPorts[ i ].Name;
							m_inputPorts[ i ].Visible = m_reference.InputPorts[ i ].Visible;
						}
						m_sizeIsDirty = true;
					}
				}
			}
			else
			{
				m_isToggleSwitchDirty = false;
			}
		}


		public override void DrawGUIControls( DrawInfo drawInfo )
		{
			base.DrawGUIControls( drawInfo );

			if ( drawInfo.CurrentEventType != EventType.MouseDown )
				return;

			if ( m_varRect.Contains( drawInfo.MousePosition ) )
			{
				m_editing = true;
			}
			else if ( m_editing )
			{
				m_editing = false;
			}
		}

		public override void Draw( DrawInfo drawInfo )
		{
			base.Draw( drawInfo );

			if ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference )
				return;

			if ( m_editing )
			{
				EditorGUI.BeginChangeCheck();
				m_currentSelectedInput = EditorGUIIntPopup( m_varRect, m_currentSelectedInput, AvailableInputsLabels, AvailableInputsValues, UIUtils.SwitchNodePopUp );
				if ( EditorGUI.EndChangeCheck() )
				{
					PreviewIsDirty = true;
					UpdateConnection();
					m_requireMaterialUpdate = true;
					m_editing = false;
				}
			}
		}

		public override void OnNodeRepaint( DrawInfo drawInfo )
		{
			base.OnNodeRepaint( drawInfo );

			if ( !m_isVisible )
				return;

			if ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference )
			{
				GUI.Label( m_iconPos, string.Empty, UIUtils.GetCustomStyle( CustomStyle.SamplerTextureIcon ) );
				GUI.enabled = false;
			}

			if ( !m_editing && ContainerGraph.LodLevel <= ParentGraph.NodeLOD.LOD2 )
			{
				ToggleSwitchNode node = ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference && m_reference != null ) ? m_reference : this;

				GUI.Label( m_varRect, node.AvailableInputsLabels[ node.m_currentSelectedInput ], UIUtils.GraphDropDown );
				GUI.Label( m_imgRect, m_popContent, UIUtils.GraphButtonIcon );
			}

			if ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference )
			{
				GUI.enabled = true;
			}
		}

		public override void DrawMainPropertyBlock()
		{
			EditorGUILayout.BeginVertical();
			{
				ShowPropertyInspectorNameGUI();
				ShowPropertyNameGUI( true );
				ShowVariableMode();
				ShowHybridInstanced();
				ShowAutoRegister();
				ShowPrecision();
				m_assignKeyword = EditorGUILayoutToggle( AssignKeywordStr, m_assignKeyword );
				if ( m_assignKeyword )
				{
					EditorGUILayout.HelpBox( string.Format( AssignKeywordInfoStr, PropertyName.ToUpper() ), MessageType.Info );
				}
				ShowToolbar();
			}
			EditorGUILayout.EndVertical();

			EditorGUILayout.Separator();
			EditorGUI.BeginChangeCheck();
			m_currentSelectedInput = EditorGUILayoutIntPopup( CurrSelectedStr, m_currentSelectedInput, AvailableInputsLabels, AvailableInputsValues );
			if ( EditorGUI.EndChangeCheck() )
			{
				UpdateConnection();
				m_requireMaterialUpdate = true;
			}
		}

		void PropertyGroup()
		{
			EditorGUI.BeginChangeCheck();
			var prevVarMode = CurrentVarMode;
			CurrentVarMode = (ToggleSwitchVariableMode)EditorGUILayoutEnumPopup( ModeStr, CurrentVarMode );
			if( EditorGUI.EndChangeCheck() )
			{
				if( CurrentVarMode == ToggleSwitchVariableMode.Reference )
				{
					UIUtils.UnregisterPropertyNode( this );
				}
				else
				{
					UIUtils.RegisterPropertyNode( this );
				}
			}

			if( CurrentVarMode == ToggleSwitchVariableMode.Reference )
			{
				string[] arr = ContainerGraph.ToggleSwitchNodes.NodesArr;
				bool guiEnabledBuffer = GUI.enabled;
				if( arr != null && arr.Length > 0 )
				{
					GUI.enabled = true;
				}
				else
				{
					m_referenceArrayId = -1;
					GUI.enabled = false;
				}

				EditorGUI.BeginChangeCheck();
				m_referenceArrayId = EditorGUILayoutPopup( Constants.AvailableReferenceStr, m_referenceArrayId, arr );
				if( EditorGUI.EndChangeCheck() )
				{
					m_reference = ContainerGraph.ToggleSwitchNodes.GetNode( m_referenceArrayId );
					if( m_reference != null )
					{
						m_referenceNodeId = m_reference.UniqueId;
						CheckReferenceValues( true );
					}
					else
					{
						m_referenceArrayId = -1;
						m_referenceNodeId = -1;
					}
				}
				GUI.enabled = guiEnabledBuffer;

				return;
			}

			DrawMainPropertyBlock();
		}

		public override void CheckPropertyFromInspector( bool forceUpdate = false )
		{
			if( m_propertyFromInspector )
			{
				if( forceUpdate || ( EditorApplication.timeSinceStartup - m_propertyFromInspectorTimestamp ) > MaxTimestamp )
				{
					m_propertyFromInspector = false;
					RegisterPropertyName( true, m_propertyInspectorName, m_autoGlobalName, m_underscoredGlobal );
					m_propertyNameIsDirty = true;

					if( CurrentVarMode != ToggleSwitchVariableMode.Reference )
					{
						ContainerGraph.ToggleSwitchNodes.UpdateDataOnNode( UniqueId, DataToArray );
					}
				}
			}
		}

		public override void DrawProperties()
		{
			//base.DrawProperties();
			NodeUtils.DrawPropertyGroup( ref m_propertiesFoldout, Constants.ParameterLabelStr, PropertyGroup );
			NodeUtils.DrawPropertyGroup( ref m_visibleCustomAttrFoldout, CustomAttrStr, DrawCustomAttributes, DrawCustomAttrAddRemoveButtons );
		}

		public override string GenerateShaderForOutput( int outputId, ref MasterNodeDataCollector dataCollector, bool ignoreLocalvar )
		{
			base.GenerateShaderForOutput( outputId, ref dataCollector, ignoreLocalvar );
			m_precisionString = UIUtils.PrecisionWirePortToCgType( CurrentPrecisionType, m_outputPorts[ 0 ].DataType );


			ToggleSwitchNode node = ( m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference && m_reference != null ) ? m_reference : this;

			string resultA = m_inputPorts[ 0 ].GenerateShaderForOutput( ref dataCollector, m_mainDataType, ignoreLocalvar, true );
			string resultB = m_inputPorts[ 1 ].GenerateShaderForOutput( ref dataCollector, m_mainDataType, ignoreLocalvar, true );
			return string.Format( LerpOp, resultA, resultB, node.m_propertyName );
		}

		public override void ReadFromString( ref string[] nodeParams )
		{
			base.ReadFromString( ref nodeParams );
			m_currentSelectedInput = Convert.ToInt32( GetCurrentParam( ref nodeParams ) );
			if( UIUtils.CurrentShaderVersion() > 18806 )
			{
				m_assignKeyword = Convert.ToBoolean( GetCurrentParam( ref nodeParams ) );
			}
			if( UIUtils.CurrentShaderVersion() >= 19902 )
			{
				string currentVarMode = GetCurrentParam( ref nodeParams );
				CurrentVarMode = (  ToggleSwitchVariableMode )Enum.Parse( typeof( ToggleSwitchVariableMode ), currentVarMode );
				if ( CurrentVarMode == ToggleSwitchVariableMode.Reference )
				{
					m_referenceNodeId = Convert.ToInt32( GetCurrentParam( ref nodeParams ) );
				}
			}
			else
			{
				CurrentVarMode = ToggleSwitchVariableMode.Create;
			}
		}

		public override void WriteToString( ref string nodeInfo, ref string connectionsInfo )
		{
			base.WriteToString( ref nodeInfo, ref connectionsInfo );
			IOUtils.AddFieldValueToString( ref nodeInfo, m_currentSelectedInput );
			IOUtils.AddFieldValueToString( ref nodeInfo, m_assignKeyword );
			IOUtils.AddFieldValueToString( ref nodeInfo, CurrentVarMode );
			if ( CurrentVarMode == ToggleSwitchVariableMode.Reference )
			{
				int referenceId = ( m_reference != null ) ? m_reference.UniqueId : -1;
				IOUtils.AddFieldValueToString( ref nodeInfo, referenceId );
			}
		}

		public override void RefreshExternalReferences()
		{
			base.RefreshExternalReferences();
			m_selectedAttribs.Clear();
			UpdateConnection();
		}

		public override void ReconnectClipboardReferences( Clipboard clipboard )
		{
			// validate node first
			int newId = clipboard.GeNewNodeId( m_referenceNodeId );
			if ( ContainerGraph.GetNode( newId ) != null )
			{
				m_referenceNodeId = newId;
			}
			RefreshExternalReferences();
		}

		public override string GetPropertyValue()
		{
			string toggleAttribute = ( m_assignKeyword ) ? "[Toggle]":"[ToggleUI]";
			return PropertyAttributes + toggleAttribute + " " + m_propertyName + "( \"" + m_propertyInspectorName + "\", Float ) = " + m_currentSelectedInput;
		}

		public override string GetUniformValue()
		{
			int index = m_containerGraph.IsSRP ? 1 : 0;
			return string.Format( Constants.UniformDec[ index ], UIUtils.PrecisionWirePortToCgType( CurrentPrecisionType, WirePortDataType.FLOAT ), m_propertyName );
		}

		public override bool GetUniformData( out string dataType, out string dataName, ref bool fullValue )
		{
			dataType = UIUtils.PrecisionWirePortToCgType( CurrentPrecisionType, WirePortDataType.FLOAT );
			dataName = m_propertyName;
			return true;
		}

		public override void DrawTitle( Rect titlePos )
		{
			bool referenceMode = m_toggleSwitchVarMode == ToggleSwitchVariableMode.Reference && m_reference != null;
			string subTitle = string.Empty;
			string subTitleFormat = string.Empty;
			if( referenceMode )
			{
				subTitle = m_reference.GetPropertyValStr();
				subTitleFormat = Constants.SubTitleRefNameFormatStr;
			}
			else
			{
				subTitle = GetPropertyValStr();
				subTitleFormat = GetSubTitleVarNameFormatStr();
			}

			SetAdditonalTitleTextOnCallback( subTitle, subTitleFormat, ( instance, newSubTitle ) => instance.AdditonalTitleContent.text = string.Format( subTitleFormat, newSubTitle ) );

			if( !m_isEditing && ContainerGraph.LodLevel <= ParentGraph.NodeLOD.LOD3 )
			{
				if ( CurrentVarMode == ToggleSwitchVariableMode.Create )
				{
					GUI.Label( titlePos, PropertyInspectorName, UIUtils.GetCustomStyle( CustomStyle.NodeTitle ) );
				}
				else
				{
					GUI.Label( titlePos, ToggleSwitchStr, UIUtils.GetCustomStyle( CustomStyle.NodeTitle ) );
				}
			}
		}

		public override void UpdateMaterial( Material mat )
		{
			base.UpdateMaterial( mat );
			if ( UIUtils.IsProperty( m_currentParameterType ) && !InsideShaderFunction )
			{
				mat.SetFloat( m_propertyName, ( float ) m_currentSelectedInput );
			}
		}

		public override void SetMaterialMode( Material mat , bool fetchMaterialValues )
		{
			base.SetMaterialMode( mat , fetchMaterialValues );
			if ( fetchMaterialValues && m_materialMode && UIUtils.IsProperty( m_currentParameterType ) && mat.HasProperty( m_propertyName ) )
			{
				m_currentSelectedInput = ( int ) mat.GetFloat( m_propertyName );
			}
		}

		public override void ForceUpdateFromMaterial( Material material )
		{
			if( UIUtils.IsProperty( m_currentParameterType ) && material.HasProperty( m_propertyName ) )
			{
				m_currentSelectedInput = (int)material.GetFloat( m_propertyName );
				PreviewIsDirty = true;
			}
		}

		public override string GetPropertyValStr()
		{
			return PropertyName;			//return m_currentSelectedInput.ToString();
		}

		public bool IsToggleSwitchDirty { get { return m_isToggleSwitchDirty; } }
		ToggleSwitchVariableMode CurrentVarMode
		{
			get { return m_toggleSwitchVarMode; }
			set
			{
				if ( m_toggleSwitchVarMode != value )
				{
					if ( value == ToggleSwitchVariableMode.Reference )
					{
						ContainerGraph.ToggleSwitchNodes.RemoveNode( this );
						m_referenceArrayId = -1;
						m_referenceNodeId = -1;
						m_reference = null;
						m_headerColorModifier = ReferenceHeaderColor;
					}
					else
					{
						m_headerColorModifier = Color.white;
						ContainerGraph.ToggleSwitchNodes.AddNode( this );
					}
				}
				m_toggleSwitchVarMode = value;
			}
		}
	}
}
