Shader /*ase_name*/ "Hidden/Built-In/Unlit" /*end*/
{
	Properties
	{
		/*ase_props*/
	}

	SubShader
	{
		/*ase_subshader_options:Name=Additional Options
			Option:Vertex Position,InvertActionOnDeselection:Absolute,Relative:Relative
				Absolute:SetDefine:ASE_ABSOLUTE_VERTEX_POS 1
				Absolute:SetPortName:1,Vertex Position
				Relative:SetPortName:1,Vertex Offset
		*/

		Tags { "RenderType"="Opaque" }

		LOD 0

		/*ase_stencil*/

		/*ase_all_modules*/

		CGINCLUDE
			#pragma target 3.5

			float4 ComputeClipSpacePosition( float2 screenPosNorm, float deviceDepth )
			{
				float4 positionCS = float4( screenPosNorm * 2.0 - 1.0, deviceDepth, 1.0 );
			#if UNITY_UV_STARTS_AT_TOP
				positionCS.y = -positionCS.y;
			#endif
				return positionCS;
			}
		ENDCG

		/*ase_pass*/
		Pass
		{
			Name "Unlit"

			CGPROGRAM
				#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
					#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
				#endif
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_instancing
				#include "UnityCG.cginc"

				/*ase_pragma*/

				struct appdata
				{
					float4 vertex : POSITION;
					/*ase_vdata:p=p*/
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					float4 pos : SV_POSITION;
					/*ase_interp(0,):sp=sp.xyzw*/
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				/*ase_globals*/

				/*ase_funcs*/

				v2f vert ( appdata v /*ase_vert_input*/)
				{
					v2f o;
					UNITY_SETUP_INSTANCE_ID( v );
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
					UNITY_TRANSFER_INSTANCE_ID( v, o );

					/*ase_vert_code:v=appdata;o=v2f*/

					float3 vertexValue = float3( 0, 0, 0 );
					#if ASE_ABSOLUTE_VERTEX_POS
						vertexValue = v.vertex.xyz;
					#endif
					vertexValue = /*ase_vert_out:Vertex Offset;Float3*/vertexValue/*end*/;
					#if ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif

					o.pos = UnityObjectToClipPos( v.vertex );
					return o;
				}

				half4 frag( v2f IN /*ase_frag_input*/ ) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID( IN );
					UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
					half4 finalColor;

					/*ase_local_var:spn*/float4 ScreenPosNorm = float4( IN.pos.xy * ( _ScreenParams.zw - 1.0 ), IN.pos.zw );
					/*ase_local_var:sp*/float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, IN.pos.z ) * IN.pos.w;
					/*ase_local_var:spu*/float4 ScreenPos = ComputeScreenPos( ClipPos );

					/*ase_frag_code:IN=v2f*/

					finalColor = /*ase_frag_out:Frag Color;Float4*/half4( 1, 1, 1, 1 )/*end*/;

					return finalColor;
				}
			ENDCG
		}
	}
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
