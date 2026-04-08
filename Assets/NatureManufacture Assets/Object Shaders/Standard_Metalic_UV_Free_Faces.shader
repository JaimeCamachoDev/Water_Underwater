Shader "NatureManufacture Shaders/Standard Shaders/Standard Metalic UV Free Faces"
{
    Properties
    {
        [NoScaleOffset]_ShapeBumpMap("Shape BumpMap", 2D) = "bump" {}
        _ShapeBumpMapScale("Shape BumpMap Scale", Range(0, 5)) = 1
        _Color("Color", Color) = (1,1,1,1)
        _Tiling("Tiling", Range(0.1, 100)) = 6
        _TriplanarFallOff("Triplanar FallOff", Range(0.0001, 100)) = 15
        [NoScaleOffset]_TopAlbedo("Top Albedo", 2D) = "white" {}
        [NoScaleOffset]_BottomAlbedo("Bottom Albedo", 2D) = "white" {}
        [HideInInspector] _texcoord("", 2D) = "white" {}
    }

    SubShader
    {
        Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

        Pass
        {
            Name "UniversalForward"
            Tags { "LightMode"="UniversalForward" }
            Cull Back
            ZWrite On

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 2.0

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

            CBUFFER_START(UnityPerMaterial)
            half4 _Color;
            float _Tiling;
            float _TriplanarFallOff;
            CBUFFER_END

            TEXTURE2D(_TopAlbedo); SAMPLER(sampler_TopAlbedo);
            TEXTURE2D(_BottomAlbedo); SAMPLER(sampler_BottomAlbedo);

            struct Attributes
            {
                float4 positionOS : POSITION;
                float3 normalOS : NORMAL;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float3 positionWS : TEXCOORD0;
                half3 normalWS : TEXCOORD1;
            };

            Varyings vert(Attributes input)
            {
                Varyings output;
                VertexPositionInputs pos = GetVertexPositionInputs(input.positionOS.xyz);
                VertexNormalInputs nrm = GetVertexNormalInputs(input.normalOS);
                output.positionHCS = pos.positionCS;
                output.positionWS = pos.positionWS;
                output.normalWS = nrm.normalWS;
                return output;
            }

            half4 SampleTriPlanar(Texture2D texObj, SamplerState samp, float3 posWS, half3 normalWS)
            {
                half3 blend = pow(abs(normalWS), max(_TriplanarFallOff, 0.0001));
                blend /= max(dot(blend, half3(1,1,1)), 0.0001);
                float2 uvX = posWS.zy * _Tiling;
                float2 uvY = posWS.xz * _Tiling;
                float2 uvZ = posWS.xy * _Tiling;
                half4 x = texObj.Sample(samp, uvX);
                half4 y = texObj.Sample(samp, uvY);
                half4 z = texObj.Sample(samp, uvZ);
                return x * blend.x + y * blend.y + z * blend.z;
            }

            half4 frag(Varyings input) : SV_Target
            {
                half3 normalWS = normalize(input.normalWS);
                half4 topCol = SampleTriPlanar(_TopAlbedo, sampler_TopAlbedo, input.positionWS, normalWS);
                half4 bottomCol = SampleTriPlanar(_BottomAlbedo, sampler_BottomAlbedo, input.positionWS, normalWS);
                half upMask = saturate(normalWS.y * 0.5h + 0.5h);
                half4 albedo = lerp(bottomCol, topCol, upMask) * _Color;
                Light mainLight = GetMainLight();
                half ndl = saturate(dot(normalWS, mainLight.direction));
                half3 lighting = SampleSH(normalWS) + mainLight.color * ndl;
                return half4(albedo.rgb * lighting, 1);
            }
            ENDHLSL
        }
    }
}
