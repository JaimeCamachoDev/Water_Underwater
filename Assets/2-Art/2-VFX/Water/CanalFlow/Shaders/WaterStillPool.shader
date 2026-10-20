// Calm pond / temple pool water for VR (Quest / Pico). Single transparent pass, no grab pass.
// - Still water: ripple layers pan in OPPOSITE directions (no net drift, the surface shimmers in place)
//   and the slow swell sways back and forth; it also modulates the ripples like passing breeze gusts.
// - Reflections from the reflection probe with box projection (big baked probe = buildings in place).
// - Depth texture: water tint by real thickness, soft shore, floor caustics (only where visible).
// - Cost: 3 normal + (near) 2 caustic samples, 1 hard shadow tap, 1 probe, 1 depth sample.
Shader "SevenWonders/Water/Still Pool"
{
    Properties
    {
        [Header(Color and depth)]
        _ShallowColor ("Shallow Color", Color) = (0.36, 0.55, 0.45, 1)
        _DeepColor ("Deep Color", Color) = (0.05, 0.17, 0.15, 1)
        _ColorDepth ("Color Depth (m)", Range(0.05, 4)) = 0.6
        _ShallowAlpha ("Shallow Opacity", Range(0, 1)) = 0.15
        _OpacityDepth ("Opacity Depth (m)", Range(0.05, 4)) = 0.9
        _MaxOpacity ("Max Opacity", Range(0, 1)) = 0.9
        _ShoreFade ("Shore Fade (m)", Range(0.001, 0.3)) = 0.04
        _Murk ("Floor Darkening With Depth", Range(0, 1)) = 0.35

        [Header(Ripples (still water, no drift))]
        [NoScaleOffset][Normal] _NormalMap ("Normal Map", 2D) = "bump" {}
        _WindDirection ("Ripple Axis (xz)", Vector) = (1, 0, 0.35, 0)
        _RippleTiling ("Ripple Tiling (repeats per m)", Float) = 1.1
        _RippleSpeed ("Ripple Shimmer Speed (m/s)", Float) = 0.035
        _RippleStrength ("Ripple Strength", Range(0, 2)) = 0.35
        _DetailTiling ("Second Layer Tiling Multiplier", Float) = 2.3
        _DetailStrength ("Second Layer Strength", Range(0, 2)) = 0.3
        _SwellTiling ("Swell Tiling (repeats per m)", Float) = 0.12
        _SwellStrength ("Swell Strength", Range(0, 2)) = 0.25
        _SwellSway ("Swell Sway (m)", Float) = 0.6
        _Gusts ("Breeze Gusts", Range(0, 1)) = 0.6
        _CalmDistance ("Calm Distance (m)", Float) = 35

        [Header(Surface)]
        _Smoothness ("Smoothness", Range(0, 1)) = 0.95
        _ReflectionStrength ("Reflection Strength", Range(0, 2)) = 1
        _ReflectionTint ("Reflection Tint", Color) = (1, 1, 1, 1)
        _SpecularStrength ("Sun Glints", Range(0, 6)) = 2
        _Scattering ("Sun Scattering", Range(0, 1)) = 0.25

        [Header(Caustics)]
        [Toggle(_CAUSTICS)] _UseCaustics ("Caustics", Float) = 1
        [NoScaleOffset] _CausticsMap ("Caustics", 2D) = "black" {}
        _CausticsTiling ("Caustics Tiling (repeats per m)", Float) = 0.8
        _CausticsStrength ("Caustics Strength", Range(0, 3)) = 0.9
        _CausticsSpeed ("Caustics Speed", Float) = 0.05
        _CausticsDepth ("Caustics Fade Depth (m)", Range(0.05, 4)) = 0.8
        _CausticsDistance ("Caustics Max Distance (m)", Float) = 25
    }

    SubShader
    {
        Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" "Queue" = "Transparent-10" "IgnoreProjector" = "True" }

        Pass
        {
            Name "StillPool"
            Tags { "LightMode" = "UniversalForward" }
            Blend One OneMinusSrcAlpha
            ZWrite Off
            Cull Back

            HLSLPROGRAM
            #pragma target 3.5
            #pragma vertex Vert
            #pragma fragment Frag
            #pragma shader_feature_local _CAUSTICS
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE
            // no _SHADOWS_SOFT: a single hard tap is enough on rippled water
            // no _REFLECTION_PROBE_BLENDING: one probe per pool is enough
            #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
            #pragma multi_compile_fog
            #pragma multi_compile_instancing

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #include "Assets/VirtualZone/EchoReveal/Runtime/EchoRevealTransparent.hlsl"

            TEXTURE2D(_NormalMap);   SAMPLER(sampler_NormalMap);
            TEXTURE2D(_CausticsMap); SAMPLER(sampler_CausticsMap);

            CBUFFER_START(UnityPerMaterial)
                half4 _ShallowColor, _DeepColor;
                half _ColorDepth, _ShallowAlpha, _OpacityDepth, _MaxOpacity, _ShoreFade, _Murk;
                float4 _WindDirection;
                float _RippleTiling, _RippleSpeed;
                half _RippleStrength;
                float _DetailTiling;
                half _DetailStrength;
                float _SwellTiling;
                half _SwellStrength;
                float _SwellSway;
                half _Gusts;
                float _CalmDistance;
                half _Smoothness, _ReflectionStrength;
                half4 _ReflectionTint;
                half _SpecularStrength, _Scattering;
                float _CausticsTiling;
                half _CausticsStrength;
                float _CausticsSpeed;
                half _CausticsDepth;
                float _CausticsDistance;
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
                float4 uvA        : TEXCOORD2; // xy = ripple layer 1, zw = ripple layer 2 (animated per vertex)
                float3 uvS        : TEXCOORD3; // xy = swell, z = fog
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

                // UVs are linear in world position: compute them per vertex (saves fragment ALU)
                float t = _Time.y;
                float2 xz = vpi.positionWS.xz;
                float2 w = normalize(_WindDirection.xz + float2(1e-4, 0));
                float2 w2 = float2(w.x * 0.8 - w.y * 0.6, w.x * 0.6 + w.y * 0.8); // ~37 deg off axis
                float pan = t * _RippleSpeed * _RippleTiling;
                // opposite directions -> interference shimmer without the surface travelling
                o.uvA.xy = xz * _RippleTiling + w * pan;
                o.uvA.zw = xz * _RippleTiling * _DetailTiling + float2(0.31, 0.77) - w2 * pan * _DetailTiling * 0.9;
                // swell sways back and forth instead of drifting
                float2 sway = w * sin(t * 0.21) * _SwellSway + w2 * sin(t * 0.13 + 1.7) * _SwellSway * 0.6;
                o.uvS = float3((xz + sway) * _SwellTiling, ComputeFogFactor(vpi.positionCS.z));
                return o;
            }

            half4 Frag(Varyings input) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(input);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

                float3 viewVec = GetWorldSpaceViewDir(input.positionWS);
                float viewDist = length(viewVec);
                half3 V = viewVec / viewDist;
                half calm = saturate(1.0 - viewDist / _CalmDistance);
                calm = 0.25 + 0.75 * calm * calm;

                // --- swell first: it also drives the breeze gusts over the ripples
                half3 nS = UnpackNormalScale(SAMPLE_TEXTURE2D(_NormalMap, sampler_NormalMap, input.uvS.xy), _SwellStrength);
                half gust = lerp(1.0, saturate(0.35 + nS.x * 2.5 + nS.y * 1.5), _Gusts);
                half rip = _RippleStrength * calm * gust;
                half3 n1 = UnpackNormalScale(SAMPLE_TEXTURE2D(_NormalMap, sampler_NormalMap, input.uvA.xy), rip);
                half3 n2 = UnpackNormalScale(SAMPLE_TEXTURE2D(_NormalMap, sampler_NormalMap, input.uvA.zw), _DetailStrength * calm * gust);
                half3 nTS = normalize(half3(n1.xy + n2.xy + nS.xy, n1.z * n2.z * nS.z));
                half3 N = half3(nTS.x, nTS.z, nTS.y);

                // --- thickness from the depth texture
                float2 screenUV = input.screenPos.xy / input.screenPos.w;
                float surfEye = input.screenPos.w;
                float sceneEye = LinearEyeDepth(SampleSceneDepth(screenUV), _ZBufferParams);
                float rayScale = viewDist / max(surfEye, 1e-4);
                float rayThick = max(0.0, sceneEye - surfEye) * rayScale; // along the view ray
                half vertThick = rayThick * saturate(V.y);                   // approximate vertical depth

                half3 waterCol = lerp(_ShallowColor.rgb, _DeepColor.rgb, 1.0 - exp(-rayThick / _ColorDepth));
                half alpha = lerp(_ShallowAlpha, _MaxOpacity, 1.0 - exp(-rayThick / _OpacityDepth));
                alpha = saturate(alpha + _Murk * (1.0 - exp(-vertThick * 2.0)) * (1.0 - alpha));

                // --- lighting (one hard shadow tap, reused for the floor caustics)
                Light mainLight = GetMainLight(TransformWorldToShadowCoord(input.positionWS));
                half shadow = mainLight.shadowAttenuation * mainLight.distanceAttenuation;
                half3 sun = mainLight.color * shadow;
                half3 L = mainLight.direction;
                half3 ambient = SampleSH(half3(0, 1, 0));
                half NdotL = saturate(L.y);
                half forward = pow(saturate(dot(-V, L) * 0.5 + 0.5), 4.0);
                half3 bodyLit = waterCol * (ambient + sun * (NdotL * 0.5 + forward * _Scattering));

                // --- reflections: box projected probe + fresnel
                half NdotV = saturate(dot(N, V));
                half f5 = 1.0 - NdotV; f5 *= f5; f5 *= f5 * (1.0 - NdotV);
                half fresnel = 0.02 + 0.98 * f5;
                half3 R = reflect(-V, N);
                half3 env = GlossyEnvironmentReflection(R, input.positionWS, 1.0 - _Smoothness, 1.0, screenUV) * _ReflectionStrength * _ReflectionTint.rgb;

                // --- sun glints (sharp highlight, masked by shadows)
                half3 H = normalize(L + V);
                half specPow = exp2(10.0 * _Smoothness + 1.0);
                half hv = 1.0 - saturate(dot(H, V)); half hv5 = hv * hv; hv5 *= hv5 * hv;
                half spec = pow(saturate(dot(N, H)), specPow) * (specPow + 8.0) * 0.318 * (0.02 + 0.98 * hv5) * _SpecularStrength;
                half3 rgb = bodyLit * alpha * (1.0 - fresnel) + env * fresnel + sun * spec;
                half outA = lerp(alpha, 1.0, fresnel);

            #if defined(_CAUSTICS)
                half causticFade = saturate(vertThick / 0.05) * exp(-vertThick / _CausticsDepth)
                                 * saturate(1.0 - viewDist / _CausticsDistance) * (1.0 - outA) * NdotL * shadow;
                UNITY_BRANCH
                if (causticFade > 0.01)
                {
                    float3 floorWS = _WorldSpaceCameraPos - V * (sceneEye * rayScale);
                    float2 cw = normalize(_WindDirection.xz + float2(1e-4, 0));
                    float2 cuv = (floorWS.xz + L.xz / max(L.y, 0.2) * vertThick) * _CausticsTiling + nTS.xy * 0.08;
                    float ct = _Time.y * _CausticsSpeed;
                    half c1 = SAMPLE_TEXTURE2D(_CausticsMap, sampler_CausticsMap, cuv + cw * ct).r;
                    half c2 = SAMPLE_TEXTURE2D(_CausticsMap, sampler_CausticsMap, cuv * 0.79 + float2(0.37, 0.13) - cw.yx * ct * 1.1).r;
                    rgb += mainLight.color * min(c1, c2) * causticFade * _CausticsStrength;
                }
            #endif

                // soft shore: water vanishes where it is only a film over the stone
                // Echo Reveal: grows with the material front (1 when no effect is running)
                half shore = saturate(rayThick / _ShoreFade) * EchoRevealVisibility(input.positionWS);
                rgb *= shore;
                outA *= shore;

                rgb = MixFogColor(rgb, unity_FogColor.rgb * outA, input.uvS.z);
                return half4(rgb, outA);
            }
            ENDHLSL
        }
    }
    FallBack Off
}
