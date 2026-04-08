Shader "NatureManufacture Shaders/Water/Standard Specular Wet"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("MainTex ", 2D) = "white" {}
        _WetColor("Wet Color", Color) = (0.6691177,0.6691177,0.6691177,1)
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
            CBUFFER_END

            TEXTURE2D(_MainTex); SAMPLER(sampler_MainTex);

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
                half4 albedo = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, input.uv) * _Color * _WetColor;
                Light mainLight = GetMainLight();
                half ndl = saturate(dot(normalWS, mainLight.direction));
                half3 lighting = SampleSH(normalWS) + mainLight.color * ndl;
                return half4(albedo.rgb * lighting, 1);
            }
            ENDHLSL
        }
    }
}
