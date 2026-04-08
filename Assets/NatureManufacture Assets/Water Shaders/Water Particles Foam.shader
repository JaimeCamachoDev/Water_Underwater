Shader "NatureManufacture Shaders/Water/Water Particles Foam"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,0)
        _ColorPower("Color Power", Vector) = (5,5,5,0)
        _Opacity("Opacity", Range(0, 20)) = 0.23
        _ParticleTexture("Particle Texture", 2D) = "white" {}
        [HideInInspector] _texcoord("", 2D) = "white" {}
    }

    SubShader
    {
        Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "IgnoreProjector"="True" }

        Pass
        {
            Name "UniversalForward"
            Tags { "LightMode"="UniversalForward" }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 2.0

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            CBUFFER_START(UnityPerMaterial)
            float4 _ParticleTexture_ST;
            half4 _Color;
            half4 _ColorPower;
            half _Opacity;
            CBUFFER_END

            TEXTURE2D(_ParticleTexture); SAMPLER(sampler_ParticleTexture);

            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
                half4 color : COLOR;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                half4 color : COLOR;
            };

            Varyings vert(Attributes input)
            {
                Varyings output;
                VertexPositionInputs pos = GetVertexPositionInputs(input.positionOS.xyz);
                output.positionHCS = pos.positionCS;
                output.uv = TRANSFORM_TEX(input.uv, _ParticleTexture);
                output.color = input.color;
                return output;
            }

            half4 frag(Varyings input) : SV_Target
            {
                half4 texCol = SAMPLE_TEXTURE2D(_ParticleTexture, sampler_ParticleTexture, input.uv);
                half4 col = texCol * _Color * input.color;
                col.rgb *= _ColorPower.rgb;
                col.a *= saturate(_Opacity);
                return col;
            }
            ENDHLSL
        }
    }
}
