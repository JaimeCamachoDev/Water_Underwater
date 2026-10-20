// Flowing canal water for VR (Quest / Pico). Single transparent pass, no opaque texture / grab pass.
// - World-space, metric UVs aligned to the flow axis -> no stretching on non-uniformly scaled planes.
// - Water thickness from the camera depth texture (already enabled in the URP asset): depth tint,
//   opacity, contact foam against canal walls and fake caustics on the canal floor.
// - _Fill (0..1) reveals the water along the flow with a foamy advancing front (driven per renderer
//   by WaterCanalSurface through a MaterialPropertyBlock).
// - Stencil bit avoids double blending where segment planes overlap at corners.
Shader "SevenWonders/Water/Canal Flow"
{
    Properties
    {
        [Header(Color and depth)]
        _ShallowColor ("Shallow Color", Color) = (0.30, 0.60, 0.55, 1)
        _DeepColor ("Deep Color", Color) = (0.04, 0.20, 0.24, 1)
        _ColorDepth ("Color Depth (m)", Range(0.01, 2)) = 0.30
        _ShallowAlpha ("Shallow Opacity", Range(0, 1)) = 0.25
        _OpacityDepth ("Opacity Depth (m)", Range(0.01, 2)) = 0.35
        _MaxOpacity ("Max Opacity", Range(0, 1)) = 0.92
        [Toggle(_SCENE_DEPTH)] _UseSceneDepth ("Use Scene Depth", Float) = 1
        _FakeDepth ("Fake Depth when no Scene Depth (m)", Range(0.01, 1)) = 0.15

        [Header(Flow)]
        [NoScaleOffset][Normal] _NormalMap ("Normal Map", 2D) = "bump" {}
        _FlowDirOS ("Flow Direction (object space)", Vector) = (-1, 0, 0, 0)
        _FlowSpeed ("Flow Speed (m/s)", Range(0, 3)) = 0.45
        _NormalTiling ("Normal Tiling (repeats per m)", Float) = 2.2
        _NormalStretch ("Stretch Along Flow", Range(1, 4)) = 2.0
        _NormalStrength ("Normal Strength", Range(0, 2)) = 0.7
        _DetailTiling ("Detail Tiling Multiplier", Float) = 2.7
        _DetailSpeed ("Detail Speed Multiplier", Float) = 1.6

        [Header(Surface)]
        _Smoothness ("Smoothness", Range(0, 1)) = 0.93
        _ReflectionStrength ("Reflection Strength", Range(0, 2)) = 1
        _SpecularStrength ("Sun Specular", Range(0, 4)) = 1.2
        _Scattering ("Sun Scattering", Range(0, 1)) = 0.35

        [Header(Foam)]
        [NoScaleOffset] _FoamMap ("Foam Mask (alpha)", 2D) = "white" {}
        _FoamColor ("Foam Color", Color) = (0.92, 0.95, 0.93, 1)
        _FoamTiling ("Foam Tiling (repeats per m)", Float) = 3.5
        _ContactFoamDepth ("Contact Foam Depth (m)", Range(0, 0.2)) = 0.035
        _BankFoam ("Bank Foam (mesh side edges)", Range(0, 1)) = 0.35
        _BankFoamWidth ("Bank Foam Width (0-1 of half width)", Range(0.01, 1)) = 0.25
        _FoamStrength ("Foam Strength", Range(0, 1)) = 0.8

        [Header(Caustics)]
        [Toggle(_CAUSTICS)] _UseCaustics ("Caustics (needs Scene Depth)", Float) = 1
        [NoScaleOffset] _CausticsMap ("Caustics", 2D) = "black" {}
        _CausticsTiling ("Caustics Tiling (repeats per m)", Float) = 3
        _CausticsStrength ("Caustics Strength", Range(0, 3)) = 0.8
        _CausticsSpeed ("Caustics Speed", Float) = 0.25

        [Header(Fill front)]
        _Fill ("Fill (0-1 along flow)", Range(0, 1)) = 1
        _FrontWidth ("Front Foam Width (m)", Range(0.01, 0.5)) = 0.12
        _HalfExtentOS ("Mesh Half Length (object space)", Float) = 5

        [Header(Stencil)]
        [IntRange] _StencilBit ("Stencil Bit Value", Range(1, 128)) = 8
    }

    SubShader
    {
        Tags
        {
            "RenderPipeline" = "UniversalPipeline"
            "RenderType" = "Transparent"
            "Queue" = "Transparent"
            "IgnoreProjector" = "True"
        }

        Pass
        {
            Name "CanalWater"
            Tags { "LightMode" = "UniversalForward" }

            Blend One OneMinusSrcAlpha // premultiplied: lets caustics brighten the canal floor behind
            ZWrite Off
            ZTest LEqual
            Cull Back

            Stencil
            {
                Ref [_StencilBit]
                ReadMask [_StencilBit]
                WriteMask [_StencilBit]
                Comp NotEqual
                Pass Replace
            }

            HLSLPROGRAM
            #pragma target 3.5
            #pragma vertex Vert
            #pragma fragment Frag

            #pragma shader_feature_local _SCENE_DEPTH
            #pragma shader_feature_local _CAUSTICS

            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile_fragment _ _SHADOWS_SOFT
            #pragma multi_compile_fog
            #pragma multi_compile_instancing

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"

            TEXTURE2D(_NormalMap);   SAMPLER(sampler_NormalMap);
            TEXTURE2D(_FoamMap);     SAMPLER(sampler_FoamMap);
            TEXTURE2D(_CausticsMap); SAMPLER(sampler_CausticsMap);

            CBUFFER_START(UnityPerMaterial)
                half4 _ShallowColor;
                half4 _DeepColor;
                half _ColorDepth;
                half _ShallowAlpha;
                half _OpacityDepth;
                half _MaxOpacity;
                half _FakeDepth;
                float4 _FlowDirOS;
                float _FlowSpeed;
                float _NormalTiling;
                float _NormalStretch;
                half _NormalStrength;
                float _DetailTiling;
                float _DetailSpeed;
                half _Smoothness;
                half _ReflectionStrength;
                half _SpecularStrength;
                half _Scattering;
                half4 _FoamColor;
                float _FoamTiling;
                half _ContactFoamDepth;
                half _BankFoam;
                half _BankFoamWidth;
                half _FoamStrength;
                float _CausticsTiling;
                half _CausticsStrength;
                float _CausticsSpeed;
                half _Fill;
                float _FrontWidth;
                float _HalfExtentOS;
                float _StencilBit;
            CBUFFER_END

            struct Attributes
            {
                float4 positionOS : POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float3 positionWS : TEXCOORD0;
                float4 screenPos  : TEXCOORD1;
                float4 flowFrame  : TEXCOORD2; // xy = flow dir (world XZ), z = across 0..1 (bank), w = distance along flow (m)
                float2 segment    : TEXCOORD3; // x = segment length (m), y = fog factor
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            Varyings Vert(Attributes input)
            {
                Varyings o = (Varyings)0;
                UNITY_SETUP_INSTANCE_ID(input);
                UNITY_TRANSFER_INSTANCE_ID(input, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                VertexPositionInputs vpi = GetVertexPositionInputs(input.positionOS.xyz);
                o.positionCS = vpi.positionCS;
                o.positionWS = vpi.positionWS;
                o.screenPos = ComputeScreenPos(vpi.positionCS);

                float3 flowOS = normalize(_FlowDirOS.xyz + float3(0, 0, 1e-5));
                float3 acrossOS = normalize(cross(float3(0, 1, 0), flowOS));
                float3 flowWS = TransformObjectToWorldDir(flowOS, false);
                float segLen = length(flowWS) * _HalfExtentOS * 2.0;
                float2 flowXZ = normalize(flowWS.xz);

                float halfExt = max(_HalfExtentOS, 1e-4);
                float along01 = dot(input.positionOS.xyz, flowOS) / (2.0 * halfExt) + 0.5; // 0 upstream .. 1 downstream
                o.flowFrame = float4(flowXZ, abs(dot(input.positionOS.xyz, acrossOS)) / halfExt, along01 * segLen);
                o.segment = float2(segLen, ComputeFogFactor(vpi.positionCS.z));
                return o;
            }

            half4 Frag(Varyings input) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(input);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

                float t = _Time.y;
                float2 flow = input.flowFrame.xy;
                float2 across = float2(-flow.y, flow.x);
                float bank = saturate(input.flowFrame.z);
                float alongM = input.flowFrame.w;
                float segLen = input.segment.x;

                // --- Fill front: water advances along the flow, front edge wobbles a little
                float2 flowUV = float2(dot(input.positionWS.xz, flow), dot(input.positionWS.xz, across));
                half frontNoise = SAMPLE_TEXTURE2D(_FoamMap, sampler_FoamMap, flowUV * 0.9 + float2(-t * 0.3, 0)).a;
                float frontPos = _Fill * (segLen + 3.0 * _FrontWidth) - 1.5 * _FrontWidth; // fill 0: hidden, fill 1: no front foam
                float frontDist = frontPos - alongM + (frontNoise - 0.5) * _FrontWidth * 0.8 + (1.0 - bank * bank) * _FrontWidth * 0.5;
                clip(frontDist);
                half frontFoam = 1.0 - saturate(frontDist / _FrontWidth);

                // --- Normals: two scrolling layers in metric flow space
                float2 uvN = float2(flowUV.x / _NormalStretch, flowUV.y) * _NormalTiling;
                float scroll = t * _FlowSpeed * _NormalTiling / _NormalStretch;
                float2 uv1 = uvN - float2(scroll, 0);
                float2 uv2 = uvN * _DetailTiling + float2(0.37, 0.71) - float2(scroll * _DetailSpeed * _DetailTiling, sin(t * 0.7) * 0.05);
                half3 n1 = UnpackNormalScale(SAMPLE_TEXTURE2D(_NormalMap, sampler_NormalMap, uv1), _NormalStrength);
                half3 n2 = UnpackNormalScale(SAMPLE_TEXTURE2D(_NormalMap, sampler_NormalMap, uv2), _NormalStrength * 0.6);
                half3 nTS = normalize(half3(n1.xy + n2.xy, n1.z * n2.z));
                // tangent = flow, bitangent = across, normal = up (horizontal water)
                half3 N = normalize(half3(flow.x * nTS.x + across.x * nTS.y, nTS.z, flow.y * nTS.x + across.y * nTS.y));

                float3 viewVec = GetWorldSpaceViewDir(input.positionWS);
                float viewDist = length(viewVec);
                half3 V = viewVec / viewDist;

                // --- Water thickness along the view ray
                float2 screenUV = input.screenPos.xy / input.screenPos.w;
                float surfEye = input.screenPos.w;
            #if defined(_SCENE_DEPTH)
                float sceneEye = LinearEyeDepth(SampleSceneDepth(screenUV), _ZBufferParams);
                float rayScale = viewDist / max(surfEye, 1e-4);
                float thickness = max(0.0, sceneEye - surfEye) * rayScale;
            #else
                float thickness = _FakeDepth * (1.0 - bank * bank) / max(V.y, 0.2);
            #endif

                half colorT = 1.0 - exp(-thickness / _ColorDepth);
                half3 waterCol = lerp(_ShallowColor.rgb, _DeepColor.rgb, colorT);
                half alpha = lerp(_ShallowAlpha, _MaxOpacity, 1.0 - exp(-thickness / _OpacityDepth));

                // --- Lighting
                float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
                Light mainLight = GetMainLight(shadowCoord);
                half lightAtten = mainLight.shadowAttenuation * mainLight.distanceAttenuation;
                half3 sun = mainLight.color * lightAtten;
                half3 ambient = SampleSH(half3(0, 1, 0));

                // body: ambient + sun scattered through the volume (stronger when looking towards the sun)
                half NdotL = saturate(dot(half3(0, 1, 0), mainLight.direction));
                half forward = pow(saturate(dot(-V, mainLight.direction) * 0.5 + 0.5), 3.0);
                half3 bodyLit = waterCol * (ambient + sun * (NdotL * 0.6 + forward * _Scattering));

                // --- Foam: contact with walls + mesh banks + advancing front, broken by the foam mask
                half foamTex = SAMPLE_TEXTURE2D(_FoamMap, sampler_FoamMap,
                    float2(flowUV.x * 0.5, flowUV.y) * _FoamTiling - float2(t * _FlowSpeed * _FoamTiling * 0.5, 0) + nTS.xy * 0.05).a;
            #if defined(_SCENE_DEPTH)
                half contact = 1.0 - saturate(thickness / max(_ContactFoamDepth, 1e-4));
            #else
                half contact = 0;
            #endif
                half bankMask = smoothstep(1.0 - _BankFoamWidth, 1.0, bank) * _BankFoam;
                half foamMask = saturate(max(max(contact, bankMask), frontFoam));
                half foam = saturate((foamTex - (1.0 - foamMask)) * 3.0) * _FoamStrength;
                foam = max(foam, frontFoam * frontFoam * 0.6 * _FoamStrength);
                half3 foamLit = _FoamColor.rgb * (ambient + sun * (NdotL * 0.8 + 0.2));

                half3 surfaceCol = lerp(bodyLit, foamLit, foam);
                alpha = lerp(alpha, 1.0, foam);

                // --- Reflection + sun specular (smoothness lowered by foam)
                half smooth = _Smoothness * (1.0 - foam * 0.8);
                half perceptualRoughness = 1.0 - smooth;
                half NdotV = saturate(dot(N, V));
                half fresnel = 0.02 + 0.98 * pow(1.0 - NdotV, 5.0);
                fresnel *= (1.0 - foam);
                half3 R = reflect(-V, N);
                half3 env = GlossyEnvironmentReflection(R, perceptualRoughness, 1.0) * _ReflectionStrength;

                half3 H = normalize(mainLight.direction + V);
                half specPow = exp2(10.0 * smooth + 1.0);
                half spec = pow(saturate(dot(N, H)), specPow) * (specPow + 8.0) * (1.0 / 25.13) * _SpecularStrength;
                half3 specCol = sun * spec * (0.02 + 0.98 * pow(1.0 - saturate(dot(H, V)), 5.0)) * 8.0;

                half outA = lerp(alpha, 1.0, fresnel);
                half3 rgb = surfaceCol * alpha * (1.0 - fresnel) + env * fresnel + specCol;

                // --- Caustics on the canal floor behind the surface (additive light, premultiplied)
            #if defined(_SCENE_DEPTH) && defined(_CAUSTICS)
                float3 floorWS = _WorldSpaceCameraPos - V * (sceneEye * rayScale);
                float2 cuv = float2(dot(floorWS.xz, flow), dot(floorWS.xz, across)) * _CausticsTiling + nTS.xy * 0.15;
                float ct = t * _CausticsSpeed;
                half c1 = SAMPLE_TEXTURE2D(_CausticsMap, sampler_CausticsMap, cuv - float2(ct * 1.3, ct * 0.3)).r;
                half c2 = SAMPLE_TEXTURE2D(_CausticsMap, sampler_CausticsMap, cuv * 0.83 + float2(0.5, 0.2) - float2(ct, -ct * 0.4)).r;
                half caustic = min(c1, c2);
                half floorShadow = MainLightRealtimeShadow(TransformWorldToShadowCoord(floorWS));
                half causticFade = saturate(thickness / 0.03) * exp(-thickness * 2.5);
                rgb += mainLight.color * caustic * floorShadow * causticFade * _CausticsStrength * (1.0 - outA) * NdotL;
            #endif

                rgb = MixFogColor(rgb, unity_FogColor.rgb * outA, input.segment.y);
                return half4(rgb, outA);
            }
            ENDHLSL
        }
    }
    FallBack Off
}
