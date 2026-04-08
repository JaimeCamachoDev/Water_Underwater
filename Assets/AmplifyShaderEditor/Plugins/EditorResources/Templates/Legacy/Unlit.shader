Shader /*ase_name*/ "Hidden/Built-In/Unlit" /*end*/
{
	Properties
	{
		/*ase_props*/
	}

	SubShader
	{
		/*ase_subshader_options:Name=Additional Options
			Option:Alpha Clipping:false,true:false
				true:ShowOption:  Use Shadow Threshold
				true:ShowPort:Alpha Clip Threshold
				true:SetDefine:_ALPHATEST_ON
				false:HideOption:  Use Shadow Threshold
				false:HidePort:Alpha Clip Threshold
				false:RemoveDefine:_ALPHATEST_ON
			Option:  Use Shadow Threshold:false,true:false
				true:SetDefine:_ALPHATEST_SHADOW_ON 1
				true:ShowPort:Alpha Clip Threshold Shadow
				true:SetShaderProperty:_UseShadowThreshold,1
				false,disable:RemoveDefine:_ALPHATEST_SHADOW_ON 1
				false,disable:HidePort:Alpha Clip Threshold Shadow
			Option:Cast Shadows:false,true:true
				true:IncludePass:ShadowCaster
				false,disable:ExcludePass:ShadowCaster
				true?Alpha Clipping=true:ShowOption:  Use Shadow Threshold
				false:HideOption:  Use Shadow Threshold
			Option:Write Depth:false,true:false
				true:SetDefine:ASE_DEPTH_WRITE_ON
				true:ShowPort:_DeviceDepth
				false,disable:RemoveDefine:ASE_DEPTH_WRITE_ON
				false,disable:HidePort:_DeviceDepth
			Option:Vertex Position,InvertActionOnDeselection:Absolute,Relative:Relative
				Absolute:SetDefine:ASE_ABSOLUTE_VERTEX_POS 1
				Absolute:SetPortName:_Vertex,Vertex Position
				Relative:SetPortName:_Vertex,Vertex Offset
		*/

		/*ase_unity_cond_begin:<=10000000*/
			// A list of master node input port IDs; will be excluded from generated shaders.
			//  0 => Frag: Color
			//  8 => Frag: Alpha Clip Threshold
			//  9 => Frag: Alpha Clip Threshold Shadow
			//  7 => Frag: Alpha
			// 15 => Vert: Vertex Offset
			// 16 => Vert: Vertex Normal
			// 28 => Frag: Depth
		/*ase_unity_cond_end*/

		Tags { "RenderType"="Opaque" }

		LOD 0

		/*ase_stencil*/

		/*ase_all_modules*/

		CGINCLUDE
			#pragma target 3.5
			#pragma exclude_renderers d3d9 // ensure rendering platforms toggle list is visible

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
			Tags { "LightMode"="ForwardBase" }

			CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_instancing
				#include "UnityCG.cginc"

				/*ase_pragma*/

				struct appdata
				{
					float4 vertex : POSITION;
					half3 normal : NORMAL;
					/*ase_vdata:p=p;n=n*/
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

				v2f vert( appdata v /*ase_vert_input*/ )
				{
					UNITY_SETUP_INSTANCE_ID(v);
					v2f o;
					UNITY_INITIALIZE_OUTPUT(v2f,o);
					UNITY_TRANSFER_INSTANCE_ID(v,o);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					/*ase_vert_code:v=appdata;o=v2f*/

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;15;-1;_Vertex*/defaultVertexValue/*end*/;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = /*ase_vert_out:Vertex Normal;Float3;16;-1;_VertexNormal*/v.normal/*end*/;

					o.pos = UnityObjectToClipPos( v.vertex );

					#if defined( ASE_SHADOWS )
						UNITY_TRANSFER_SHADOW( o, v.texcoord );
					#endif
					return o;
				}

				half4 frag( v2f IN /*ase_frag_input*/
							#if defined( ASE_DEPTH_WRITE_ON )
								, out float outputDepth : SV_Depth
							#endif
				) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID( IN );
					UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

					/*ase_local_var:spn*/float4 ScreenPosNorm = float4( IN.pos.xy * ( _ScreenParams.zw - 1.0 ), IN.pos.zw );
					/*ase_local_var:sp*/float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, IN.pos.z ) * IN.pos.w;
					/*ase_local_var:spu*/float4 ScreenPos = ComputeScreenPos( ClipPos );

					/*ase_frag_code:IN=v2f*/

					float4 Color = /*ase_frag_out:Color;Float4;0;-1;_Color*/float4( 1, 1, 1, 1 )/*end*/;
					float Alpha = /*ase_frag_out:Alpha;Float;7;-1;_Alpha*/1/*end*/;
					half AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;8;-1;_AlphaClip*/0.5/*end*/;
					half AlphaClipThresholdShadow = /*ase_frag_out:Alpha Clip Threshold Shadow;Float;9;-1;_AlphaClipShadow*/0.5/*end*/;

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = /*ase_frag_out:Depth;Float;28;-1;_DeviceDepth*/IN.pos.z/*end*/;
					#endif

					#ifdef _ALPHATEST_ON
						clip( Alpha - AlphaClipThreshold );
					#endif

					return Color;
				}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			/*ase_hide_pass*/
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_shadowcaster
				#ifndef UNITY_PASS_SHADOWCASTER
					#define UNITY_PASS_SHADOWCASTER
				#endif
				#include "HLSLSupport.cginc"
				#include "UnityShaderVariables.cginc"
				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "UnityPBSLighting.cginc"

				/*ase_pragma*/

				struct appdata
				{
					float4 vertex : POSITION;
					half3 normal : NORMAL;
					/*ase_vdata:p=p;n=n*/
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					V2F_SHADOW_CASTER;
					/*ase_interp(1,):sp=sp*/
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				#ifdef UNITY_STANDARD_USE_DITHER_MASK
					sampler3D _DitherMaskLOD;
				#endif
				#ifdef ASE_TESSELLATION
					float _TessPhongStrength;
					float _TessValue;
					float _TessMin;
					float _TessMax;
					float _TessEdgeLength;
					float _TessMaxDisp;
				#endif

				/*ase_globals*/

				/*ase_funcs*/

				v2f vert( appdata v /*ase_vert_input*/ )
				{
					UNITY_SETUP_INSTANCE_ID( v );
					v2f o;
					UNITY_INITIALIZE_OUTPUT( v2f, o );
					UNITY_TRANSFER_INSTANCE_ID( v, o );
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

					/*ase_vert_code:v=appdata;o=v2f*/

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;15;-1;_Vertex*/defaultVertexValue/*end*/;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = /*ase_vert_out:Vertex Normal;Float3;16;-1;_VertexNormal*/v.normal/*end*/;

					TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
					return o;
				}

				half4 frag( v2f IN /*ase_frag_input*/
							#if defined( ASE_DEPTH_WRITE_ON )
								, out float outputDepth : SV_Depth
							#endif
							) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID(IN);

					#ifdef LOD_FADE_CROSSFADE
						UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
					#endif

					/*ase_frag_code:IN=v2f*/

					float Alpha = /*ase_frag_out:Alpha;Float;7;-1;_Alpha*/1/*end*/;
					half AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;8;-1;_AlphaClip*/0.5/*end*/;
					half AlphaClipThresholdShadow = /*ase_frag_out:Alpha Clip Threshold Shadow;Float;9;-1;_AlphaClipShadow*/0.5/*end*/;

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = /*ase_frag_out:Depth;Float;28;-1;_DeviceDepth*/IN.pos.z/*end*/;
					#endif

					#ifdef _ALPHATEST_SHADOW_ON
						if (unity_LightShadowBias.z != 0.0)
							clip(Alpha - AlphaClipThresholdShadow);
						#ifdef _ALPHATEST_ON
						else
							clip(Alpha - AlphaClipThreshold);
						#endif
					#else
						#ifdef _ALPHATEST_ON
							clip(Alpha - AlphaClipThreshold);
						#endif
					#endif

					#ifdef UNITY_STANDARD_USE_DITHER_MASK
						half alphaRef = tex3D(_DitherMaskLOD, float3(IN.pos.xy*0.25,Alpha*0.9375)).a;
						clip(alphaRef - 0.01);
					#endif

					SHADOW_CASTER_FRAGMENT(IN)
				}
			ENDCG
		}
		/*ase_pass_end*/
	}
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
