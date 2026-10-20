// Fountain basin water for VR (Quest / Pico), built from the ideas of "Ripples V2":
// polar-coordinate flow (with noise twirl) opening outwards from where the water lands, plus expanding
// concentric ripples around the landing radius, without the Scene Color pass (opaque texture is off).
// Meshes come from WaterFountain (annuli around the object-space Y axis):
//   uv0 = (landing radius, activity 0..1 = how much water is falling in now)
//   uv1 = (inner radius, outer radius)
// Depth texture gives thickness tint, opacity, contact foam and floor caustics like "Canal Flow".
Shader "SevenWonders/Water/Fountain Pool"
{
    Properties
    {
        [Header(Color and depth)]
        _ShallowColor ("Shallow Color", Color) = (0.33, 0.62, 0.55, 1)
        _DeepColor ("Deep Color", Color) = (0.05, 0.22, 0.26, 1)
        _ColorDepth ("Color Depth (m)", Range(0.01, 2)) = 0.25
        _ShallowAlpha ("Shallow Opacity", Range(0, 1)) = 0.2
        _OpacityDepth ("Opacity Depth (m)", Range(0.01, 2)) = 0.3
        _MaxOpacity ("Max Opacity", Range(0, 1)) = 0.85

        [Header(Radial flow (polar))]
        [NoScaleOffset][Normal] _NormalMap ("Normal Map", 2D) = "bump" {}
        _RadialTiling ("Radial Tiling (on r squared)", Float) = 9
        _AngularTiling ("Angular Tiling (integer)", Float) = 12
        _FlowSpeed ("Outward Flow Speed", Float) = 0.35
        _Twirl ("Noise Twirl", Range(0, 1)) = 0.25
        _NoiseScale ("Twirl Noise Scale (1/m)", Float) = 2.5
        _FlowNormal ("Flow Normal Strength", Range(0, 2)) = 0.7
        _IdleNormal ("Calm Normal Strength", Range(0, 1)) = 0.25
        _PlanarTiling ("Calm Normal Tiling (1/m)", Float) = 4

        [Header(Ripples from the landing ring)]
        _RippleWavelength ("Wavelength (m)", Range(0.01, 0.3)) = 0.06
        _RippleSpeed ("Speed (rings per second)", Float) = 2.2
        _RippleStrength ("Slope Strength", Range(0, 3)) = 1.1
        _RippleDamping ("Damping (1/m)", Float) = 9
        _RippleHeight ("Vertex Height (m)", Range(0, 0.02)) = 0.004
        _RippleJitter ("Phase Noise", Range(0, 2)) = 0.8
        _SlopeShade ("Slope Shading (fake refraction)", Range(0, 4)) = 1.6
        _SlopeOpacity ("Slope Opacity", Range(0, 2)) = 0.8

        [Header(Foam)]
        [NoScaleOffset] _FoamMap ("Foam Mask (alpha)", 2D) = "white" {}
        _FoamColor ("Foam Color", Color) = (0.92, 0.95, 0.93, 1)
        _FoamTiling ("Foam Angular Tiling (integer)", Float) = 8
        _ImpactFoam ("Impact Foam", Range(0, 1)) = 0.8
        _ImpactFoamWidth ("Impact Foam Width (m)", Range(0.005, 0.3)) = 0.05
        _ContactFoamDepth ("Contact Foam Depth (m)", Range(0, 0.1)) = 0.02

        [Header(Surface)]
        _Smoothness ("Smoothness", Range(0, 1)) = 0.93
        _ReflectionStrength ("Reflection Strength", Range(0, 2)) = 1
        _SpecularStrength ("Sun Specular", Range(0, 4)) = 1.2

        [Header(Caustics)]
        [Toggle(_CAUSTICS)] _UseCaustics ("Caustics", Float) = 1
        [NoScaleOffset] _CausticsMap ("Caustics", 2D) = "black" {}
        _CausticsTiling ("Caustics Tiling (1/m)", Float) = 4
        _CausticsStrength ("Caustics Strength", Range(0, 3)) = 1
        _CausticsSpeed ("Caustics Speed", Float) = 0.25
    }

    SubShader
    {
        Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" "Queue" = "Transparent" "IgnoreProjector" = "True" }

        Pass
        {
            Name "FountainPool"
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
                half4 _ShallowColor, _DeepColor;
                half _ColorDepth, _ShallowAlpha, _OpacityDepth, _MaxOpacity;
                float _RadialTiling, _AngularTiling, _FlowSpeed, _Twirl, _NoiseScale;
                half _FlowNormal, _IdleNormal;
                float _PlanarTiling;
                float _RippleWavelength, _RippleSpeed, _RippleDamping, _RippleHeight;
                half _RippleStrength, _RippleJitter;
                half _SlopeShade, _SlopeOpacity;
                half4 _FoamColor;
                float _FoamTiling;
                half _ImpactFoam, _ImpactFoamWidth, _ContactFoamDepth;
                half _Smoothness, _ReflectionStrength, _SpecularStrength;
                float _CausticsTiling;
                half _CausticsStrength;
                float _CausticsSpeed;
            CBUFFER_END

            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float3 positionWS : TEXCOORD0;
                float4 screenPos  : TEXCOORD1;
                float4 polar      : TEXCOORD2; // x = r, y = angle 0..1, z = landing radius, w = activity
                float3 planar     : TEXCOORD3; // xy = object xz, z = fog
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            // expanding rings: returns height (x) and radial slope (y)
            float2 Rings(float d, float jitter, float activity)
            {
                float ad = abs(d);
                float k = 6.2832 / _RippleWavelength;
                float env = exp(-ad * _RippleDamping) * activity;
                float ph1 = ad * k - _Time.y * _RippleSpeed * 6.2832 + jitter;
                float ph2 = ad * k * 1.73 - _Time.y * _RippleSpeed * 1.31 * 6.2832 + jitter * 1.7;
                float h = (sin(ph1) + 0.45 * sin(ph2)) * env;
                float dh = (cos(ph1) * k + 0.45 * 1.73 * k * cos(ph2)) * env - _RippleDamping * h;
                return float2(h, dh * sign(d));
            }

            Varyings Vert(Attributes input)
            {
                Varyings o = (Varyings)0;
                UNITY_SETUP_INSTANCE_ID(input);
                UNITY_TRANSFER_INSTANCE_ID(input, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                float3 p = input.positionOS.xyz;
                float r = length(p.xz);
                float angle = atan2(p.x, p.z) * (1.0 / 6.2832) + 0.5;
                float activity = input.uv0.y;
                float edge = saturate((r - input.uv1.x) / 0.02) * saturate((input.uv1.y - r) / 0.02); // pinned at the walls
                p.y += Rings(r - input.uv0.x, 0, activity).x * _RippleHeight * edge;

                VertexPositionInputs vpi = GetVertexPositionInputs(p);
                o.positionCS = vpi.positionCS;
                o.positionWS = vpi.positionWS;
                o.screenPos = ComputeScreenPos(vpi.positionCS);
                o.polar = float4(r, angle, input.uv0.x, activity);
                o.planar = float3(p.xz, ComputeFogFactor(vpi.positionCS.z));
                return o;
            }

            half4 Frag(Varyings input) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(input);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

                float t = _Time.y;
                float r = input.polar.x, angle = input.polar.y, rL = input.polar.z;
                half activity = saturate(input.polar.w);
                float2 xz = input.planar.xy;
                float d = r - rL;

                // --- twirl noise (from the foam mask, planar) bends the polar flow like Ripples V2
                half noise = SAMPLE_TEXTURE2D_LOD(_FoamMap, sampler_FoamMap, xz * _NoiseScale + t * 0.03, 6).a; // low mip = smooth noise
                float twirl = (noise - 0.5) * _Twirl;

                // --- radial flow: coordinate on |r^2 - rL^2| so the water slows down while it opens up
                float radial = abs(r * r - rL * rL) * _RadialTiling;
                // continuous angle derivatives (atan2 wraps at the seam -> wrong mip without this)
                float2 dA = float2(ddx(angle), ddy(angle));
                float a2 = frac(angle + 0.5);
                float2 dA2 = float2(ddx(a2), ddy(a2));
                if (dot(dA2, dA2) < dot(dA, dA)) dA = dA2;
                float2 dTw = float2(ddx(twirl), ddy(twirl));
                float2 dR = float2(ddx(radial), ddy(radial));
                float2 uvA = float2((angle + twirl) * _AngularTiling, radial - t * _FlowSpeed);
                float2 uvB = float2((angle - twirl * 0.7) * _AngularTiling * 2.0 + 0.37, radial * 1.9 - t * _FlowSpeed * 1.6);
                half flowAmt = lerp(0.35, 1.0, activity) * _FlowNormal;
                half3 nA = UnpackNormalScale(SAMPLE_TEXTURE2D_GRAD(_NormalMap, sampler_NormalMap, uvA, float2((dA.x + dTw.x) * _AngularTiling, dR.x), float2((dA.y + dTw.y) * _AngularTiling, dR.y)), flowAmt);
                half3 nB = UnpackNormalScale(SAMPLE_TEXTURE2D_GRAD(_NormalMap, sampler_NormalMap, uvB, float2((dA.x - dTw.x * 0.7) * _AngularTiling * 2.0, dR.x * 1.9), float2((dA.y - dTw.y * 0.7) * _AngularTiling * 2.0, dR.y * 1.9)), flowAmt * 0.6);
                half3 nC = UnpackNormalScale(SAMPLE_TEXTURE2D(_NormalMap, sampler_NormalMap, xz * _PlanarTiling + float2(t * 0.02, -t * 0.015)), _IdleNormal);
                half3 nTS = normalize(half3(nA.xy + nB.xy + nC.xy, nA.z * nB.z * nC.z));

                // --- expanding rings around the landing radius (analytic slope)
                float2 ring = Rings(d, noise * 6.2832 * _RippleJitter, activity);
                nTS.x -= ring.y * _RippleWavelength * 0.16 * _RippleStrength;
                nTS = normalize(nTS);

                // polar frame: x = outward, y = around, z = up
                float2 radialDir = r > 1e-4 ? xz / r : float2(0, 1);
                float3 outW = TransformObjectToWorldDir(float3(radialDir.x, 0, radialDir.y));
                float3 aroundW = TransformObjectToWorldDir(float3(radialDir.y, 0, -radialDir.x));
                half3 N = normalize(outW * nTS.x + aroundW * nTS.y + float3(0, 1, 0) * nTS.z);

                float3 viewVec = GetWorldSpaceViewDir(input.positionWS);
                float viewDist = length(viewVec);
                half3 V = viewVec / viewDist;

                // --- thickness from the depth texture
                float2 screenUV = input.screenPos.xy / input.screenPos.w;
                float surfEye = input.screenPos.w;
                float sceneEye = LinearEyeDepth(SampleSceneDepth(screenUV), _ZBufferParams);
                float rayScale = viewDist / max(surfEye, 1e-4);
                float thickness = max(0.0, sceneEye - surfEye) * rayScale;

                half3 waterCol = lerp(_ShallowColor.rgb, _DeepColor.rgb, 1.0 - exp(-thickness / _ColorDepth));
                half alpha = lerp(_ShallowAlpha, _MaxOpacity, 1.0 - exp(-thickness / _OpacityDepth));

                Light mainLight = GetMainLight(TransformWorldToShadowCoord(input.positionWS));
                half3 sun = mainLight.color * (mainLight.shadowAttenuation * mainLight.distanceAttenuation);
                half3 ambient = SampleSH(half3(0, 1, 0));
                half NdotL = saturate(mainLight.direction.y);
                half3 bodyLit = waterCol * (ambient + sun * NdotL * 0.6);
                // no refraction pass: read the waves through their slope (lit/dark facets, more opaque where churned)
                half slope = saturate(length(nTS.xy));
                half facing = dot(N.xz, normalize(mainLight.direction.xz + 1e-4));
                bodyLit *= saturate(1.0 + facing * _SlopeShade);
                alpha = saturate(alpha + slope * _SlopeOpacity * (1.0 - alpha));

                // --- foam: churned water where it lands + contact with the stone
                float2 uvF = float2((angle + twirl) * _FoamTiling, radial * 0.6 - t * _FlowSpeed * 0.8) + nTS.xy * 0.03;
                half foamTex = SAMPLE_TEXTURE2D_GRAD(_FoamMap, sampler_FoamMap, uvF, float2((dA.x + dTw.x) * _FoamTiling, dR.x * 0.6), float2((dA.y + dTw.y) * _FoamTiling, dR.y * 0.6)).a;
                half impact = exp(-abs(d) / _ImpactFoamWidth) * activity * _ImpactFoam;
                half contact = 1.0 - saturate(thickness / max(_ContactFoamDepth, 1e-4));
                half foamMask = saturate(max(impact, contact * 0.8));
                half foam = saturate((foamTex - (1.0 - foamMask)) * 2.5);
                half3 foamLit = _FoamColor.rgb * (ambient + sun * (NdotL * 0.8 + 0.2));
                half3 surfaceCol = lerp(bodyLit, foamLit, foam);
                alpha = lerp(alpha, 1.0, foam);

                half smooth = _Smoothness * (1.0 - foam * 0.8);
                half NdotV = saturate(dot(N, V));
                half fresnel = (0.02 + 0.98 * pow(1.0 - NdotV, 5.0)) * (1.0 - foam);
                half3 env = GlossyEnvironmentReflection(reflect(-V, N), 1.0 - smooth, 1.0) * _ReflectionStrength;
                half3 H = normalize(mainLight.direction + V);
                half specPow = exp2(10.0 * smooth + 1.0);
                half spec = pow(saturate(dot(N, H)), specPow) * (specPow + 8.0) * (1.0 / 25.13) * _SpecularStrength;
                half3 specCol = sun * spec * (0.02 + 0.98 * pow(1.0 - saturate(dot(H, V)), 5.0)) * 8.0;

                half outA = lerp(alpha, 1.0, fresnel);
                half3 rgb = surfaceCol * alpha * (1.0 - fresnel) + env * fresnel + specCol;

            #if defined(_CAUSTICS)
                float3 floorWS = _WorldSpaceCameraPos - V * (sceneEye * rayScale);
                float2 cuv = floorWS.xz * _CausticsTiling + nTS.xy * 0.15;
                float ct = t * _CausticsSpeed;
                half c1 = SAMPLE_TEXTURE2D(_CausticsMap, sampler_CausticsMap, cuv + float2(ct, ct * 0.4)).r;
                half c2 = SAMPLE_TEXTURE2D(_CausticsMap, sampler_CausticsMap, cuv * 0.83 + float2(0.5, 0.2) - float2(ct * 0.7, -ct)).r;
                half floorShadow = MainLightRealtimeShadow(TransformWorldToShadowCoord(floorWS));
                half causticFade = saturate(thickness / 0.02) * exp(-thickness * 3.0);
                rgb += mainLight.color * min(c1, c2) * floorShadow * causticFade * _CausticsStrength * (1.0 - outA) * NdotL;
            #endif

                rgb = MixFogColor(rgb, unity_FogColor.rgb * outA, input.planar.z);
                return half4(rgb, outA);
            }
            ENDHLSL
        }
    }
    FallBack Off
}
