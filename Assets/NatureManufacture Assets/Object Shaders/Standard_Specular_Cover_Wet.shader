Shader "NatureManufacture Shaders/Water/Standard Specular Cover Wet"
{
    Properties
    {
        _WetColor("Wet Color", Color) = (0.6691177,0.6691177,0.6691177,1)
        _MainTex("MainTex", 2D) = "white" {}
        _Color("Color", Color) = (1,1,1,1)
        _Cover_Amount("Cover_Amount", Range(0, 2)) = 0.13
        _CoverAlbedoRGB("Cover Albedo (RGB)", 2D) = "white" {}
        _CoverAlbedoColor("Cover Albedo Color", Color) = (1,1,1,1)
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
            float4 _MainTex_ST;
            half4 _Color;
            half4 _WetColor;
            half4 _CoverAlbedoColor;
            half _Cover_Amount;
            CBUFFER_END

            TEXTURE2D(_MainTex); SAMPLER(sampler_MainTex);
            TEXTURE2D(_CoverAlbedoRGB); SAMPLER(sampler_CoverAlbedoRGB);

            struct Attributes { float4 positionOS:POSITION; float3 normalOS:NORMAL; float2 uv:TEXCOORD0; };
            struct Varyings { float4 positionHCS:SV_POSITION; half3 normalWS:TEXCOORD0; float2 uv:TEXCOORD1; };

            Varyings vert(Attributes input)
            {
                Varyings output;
                VertexPositionInputs pos = GetVertexPositionInputs(input.positionOS.xyz);
                VertexNormalInputs nrm = GetVertexNormalInputs(input.normalOS);
                output.positionHCS = pos.positionCS;
                output.normalWS = nrm.normalWS;
                output.uv = TRANSFORM_TEX(input.uv, _MainTex);
                return output;
            }

            half4 frag(Varyings input) : SV_Target
            {
                half3 normalWS = normalize(input.normalWS);
                half4 baseCol = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, input.uv) * _Color * _WetColor;
                half4 coverCol = SAMPLE_TEXTURE2D(_CoverAlbedoRGB, sampler_CoverAlbedoRGB, input.uv) * _CoverAlbedoColor;
                half4 albedo = lerp(baseCol, coverCol, saturate(_Cover_Amount * 0.5h));
                Light mainLight = GetMainLight();
                half ndl = saturate(dot(normalWS, mainLight.direction));
                half3 lighting = SampleSH(normalWS) + mainLight.color * ndl;
                return half4(albedo.rgb * lighting, 1);
            }
            ENDHLSL
        }
    }
}
