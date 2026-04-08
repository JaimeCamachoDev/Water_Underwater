 Shader "NatureManufacture Shaders/Water/Water Stylized Mobile Vertex Color Flow"
{
    Properties
    {
        _GlobalTiling("Global Tiling", Range(0.001, 100)) = 1
        [ToggleUI]_UVVDirection1UDirection0("UV Direction - V(T) U(F)", Float) = 1
        _SlowWaterSpeed("Main Water Speed", Vector) = (0.3, 0.3, 0, 0)
        _SmallCascadeMainSpeed("Small Cascade Main Speed", Vector) = (1, 1, 0, 0)
        _BigCascadeMainSpeed("Big Cascade Main Speed", Vector) = (0.9, 0.9, 0, 0)
        _EdgeFalloffMultiply("Edge Falloff Multiply", Float) = 5.19
        _EdgeFalloffPower("Edge Falloff Power", Float) = 0.74
        _CleanFalloffMultiply("Clean Falloff Multiply", Float) = 1.29
        _CleanFalloffPower("Clean Falloff Power", Float) = 0.38
        _ShalowColor("Shalow Color", Color) = (0, 0.4811321, 0.4625075, 0)
        _ShalowFalloffMultiply("Shalow Falloff Multiply", Float) = 1.043
        _ShalowFalloffPower("Shalow Falloff Power", Float) = 3.9
        _DeepColor("Deep Color", Color) = (0.006274463, 0.306972, 0.4433962, 0)
        _WaterAlphaMultiply("Water Alpha Multiply", Float) = 0.66
        _WaterAlphaPower("Water Alpha Power", Float) = 1.39
        _OutlinePower("Outline Power", Range(0, 1)) = 0
        _OutlineFalloffBorder("Outline Falloff Border", Range(0, 200)) = 100
        _Outline_Color("Outline Color", Color) = (1, 1, 1, 0)
        _WaterSmoothness("Water Smoothness", Range(0, 1)) = 0.9
        _WaterSpecularClose("Water Specular Close", Range(0, 1)) = 0.9
        _WaterSpecularFar("Water Specular Far", Range(0, 1)) = 0.9
        _WaterSpecularThreshold("Water Specular Threshold", Range(0, 10)) = 0.39
        _Distortion("Distortion", Range(0, 1)) = 0.1
        _BackfaceAlpha("Backface Alpha", Range(0, 1)) = 0.85
        [Normal][NoScaleOffset]_SlowWaterNormal("Water Normal", 2D) = "bump" {}
        _SlowWaterTiling("Water Tiling", Vector) = (1, 1, 0, 0)
        _SlowNormalScale("Water Normal Scale", Float) = 0.3
        _FarNormalPower("Far Normal Power", Range(0, 1)) = 0.5
        _SmallCascadeAngle("Small Cascade Angle", Range(0.001, 90)) = 0.6
        _SmallCascadeAngleFalloff("Small Cascade Angle Falloff", Range(0, 80)) = 2
        _SmallCascadeTiling("Small Cascade Tiling", Vector) = (2, 2, 0, 0)
        _SmallCascadeNormalScale("Small Cascade Normal Scale", Float) = 0.5
        _SmallCascadeColor("Small Cascade Color", Vector) = (20, 20, 20, 0)
        _SmallCascadeFoamFalloff("Small Cascade Foam Falloff", Range(0, 10)) = 4.11
        _SmallCascadeSmoothness("Small Cascade Smoothness", Range(0, 1)) = 0
        _SmallCascadeSpecular("Small Cascade Specular", Range(0, 1)) = 0.8
        _BigCascadeAngle("Big Cascade Angle", Range(0.001, 90)) = 10.2
        _BigCascadeAngleFalloff("Big Cascade Angle Falloff", Range(0, 80)) = 2.3
        _BigCascadeNormalScale("Big Cascade Normal Scale", Float) = 0.6
        _BigCascadeTiling("Big Cascade Tiling", Vector) = (1, 1, 0, 0)
        _BigCascadeSmoothness("Big Cascade Smoothness", Range(0, 1)) = 0
        _BigCascadeSpecular("Big Cascade Specular", Range(0, 1)) = 0.84
        _BigCascadeColor("Big Cascade Color", Vector) = (20, 20, 20, 0)
        Big_Cascade_Foam_Falloff("Big Cascade Foam Falloff", Range(0, 10)) = 2.86
        _BigCascadeTransparency("Big Cascade Transparency", Range(0, 1)) = 0.005
        _SmallCascadeNoisePower("Small Cascade Noise Power", Range(0, 10)) = 8.4
        _BigCascadeNoisePower("Big Cascade Noise Power", Range(0, 10)) = 10
        _SmallCascadeNoiseMultiply("Small Cascade Noise Multiply", Range(0, 40)) = 28.7
        _BigCascadeNoiseMultiply("Big Cascade Noise Multiply", Range(0, 40)) = 20
        _FoamColor("Foam Color", Vector) = (20, 20, 20, 0)
        _FoamTiling("Foam Tiling", Vector) = (3, 3, 0, 0)
        _FoamSpeed("Foam Speed", Vector) = (0.3, 0.3, 0, 0)
        _FoamDepth("Foam Depth", Range(0, 10)) = 0.99
        _FoamFalloff("Foam Falloff", Range(-100, 0)) = -15.3
        _FoamSmoothness("Foam Smoothness", Range(0, 1)) = 0
        _FoamSpecular("Foam Specular", Range(0, 1)) = 0
        _NoiseTiling("Noise Tiling", Vector) = (2, 2, 0, 0)
        _NoiseSpeed("Noise Speed", Vector) = (3, 3, 0, 0)
        _AOPower("AO Power", Range(0, 1)) = 1
        _WaterFlowUVRefresSpeed("Water Flow UV Refresh Speed", Range(0, 1)) = 0.15
        _SmallCascadeFlowUVRefreshSpeed("Small Cascade Flow UV Refresh Speed", Range(0, 1)) = 0.4
        _BigCascadeFlowUVRefreshSpeed("Big Cascade Flow UV Refresh Speed", Range(0, 1)) = 0.6
        [NoScaleOffset]_CascadesTexturesRGFoamBNoiseA("Cascades Textures (RG) Foam (B) Noise (A)", 2D) = "white" {}
        [Toggle]_DISTORTION("Use Distortion", Float) = 0
        [HideInInspector]_WorkflowMode("_WorkflowMode", Float) = 0
        [HideInInspector]_CastShadows("_CastShadows", Float) = 1
        [HideInInspector]_ReceiveShadows("_ReceiveShadows", Float) = 1
        [HideInInspector]_Surface("_Surface", Float) = 1
        [HideInInspector]_Blend("_Blend", Float) = 0
        [HideInInspector]_AlphaClip("_AlphaClip", Float) = 0
        [HideInInspector]_BlendModePreserveSpecular("_BlendModePreserveSpecular", Float) = 0
        [HideInInspector]_SrcBlend("_SrcBlend", Float) = 1
        [HideInInspector]_DstBlend("_DstBlend", Float) = 0
        [HideInInspector][ToggleUI]_ZWrite("_ZWrite", Float) = 0
        [HideInInspector]_ZWriteControl("_ZWriteControl", Float) = 1
        [HideInInspector]_ZTest("_ZTest", Float) = 4
        [HideInInspector]_Cull("_Cull", Float) = 0
        [HideInInspector]_AlphaToMask("_AlphaToMask", Float) = 0
        [HideInInspector]_QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector]_QueueControl("_QueueControl", Float) = -1
        [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
    }
    SubShader
    {
        Tags
        {
            "RenderPipeline"="UniversalPipeline"
            "RenderType"="Transparent"
            "UniversalMaterialType" = "Lit"
            "Queue"="Transparent"
            "DisableBatching"="False"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="UniversalLitSubTarget"
        }
        Pass
        {
            Name "Universal Forward"
            Tags
            {
                "LightMode" = "UniversalForward"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        AlphaToMask [_AlphaToMask]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ USE_LEGACY_LIGHTMAPS
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
        #pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _LIGHT_LAYERS
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma multi_compile_fragment _ _LIGHT_COOKIES
        #pragma multi_compile _ _FORWARD_PLUS
        #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
        #pragma shader_feature_fragment _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local_fragment _ _ALPHAPREMULTIPLY_ON
        #pragma shader_feature_local_fragment _ _ALPHAMODULATE_ON
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local_fragment _ _SPECULAR_SETUP
        #pragma shader_feature_local _ _RECEIVE_SHADOWS_OFF
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_SHADOW_COORD
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_FORWARD
        #define _FOG_FRAGMENT 1
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_OPAQUE_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3 : TEXCOORD3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord;
            #endif
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TangentSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TimeParameters;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV : INTERP0;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh : INTERP2;
            #endif
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord : INTERP3;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP5;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3 : INTERP6;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP7;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight : INTERP8;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP9;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP10;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord3 = input.texCoord3.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Multiply_half2_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Branch_half2(half Predicate, half2 True, half2 False, out half2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_half(half A, half B, out half Out)
        {
            Out = A + B;
        }
        
        void Unity_Fraction_half(half In, out half Out)
        {
            Out = frac(In);
        }
        
        void Unity_Divide_half(half A, half B, out half Out)
        {
            Out = A / B;
        }
        
        void Unity_Add_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A + B;
        }
        
        void Unity_NormalStrength_half(half3 In, half Strength, out half3 Out)
        {
            Out = half3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Lerp_half3(half3 A, half3 B, half3 T, out half3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Normalize_half3(half3 In, out half3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Combine_half(half R, half G, half B, half A, out half4 RGBA, out half3 RGB, out half2 RG)
        {
            RGBA = half4(R, G, B, A);
            RGB = half3(R, G, B);
            RG = half2(R, G);
        }
        
        void Unity_SceneColor_half(half4 UV, out half3 Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_COLOR(UV.xy);
        }
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Multiply_half3_half3(half3 A, half3 B, out half3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Multiply_half4_half4(half4 A, half4 B, out half4 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half3 BaseColor;
            half3 NormalTS;
            half3 Emission;
            half Metallic;
            half3 Specular;
            half Smoothness;
            half Occlusion;
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7be063d957af468180e6d5402ca51556_Out_0_Float = _Distortion;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2 = _SlowWaterSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2 = _SlowWaterTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2, _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2, (_UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4.xy), _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[0];
            half _Split_3275572cd890568f980cafc7c60f69f9_G_2_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[1];
            half _Split_3275572cd890568f980cafc7c60f69f9_B_3_Float = 0;
            half _Split_3275572cd890568f980cafc7c60f69f9_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2 = half2(_Split_3275572cd890568f980cafc7c60f69f9_G_2_Float, _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2;
            Unity_Branch_half2(_Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean, _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2, _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2, _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float = _WaterFlowUVRefresSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float, _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(1), _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float;
            Unity_Fraction_half(_Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float, _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float;
            Unity_Divide_half(half(1), _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float, _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, (_UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4.xy), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float.xx), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2) );
            _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4);
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_R_4_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.r;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_G_5_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.g;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_B_6_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.b;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_A_7_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_30c36922aabc618192374556ee8ce299_Out_0_Float = _SlowNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(0.5), _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float;
            Unity_Fraction_half(_Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float, _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2;
            Unity_Add_half2(_Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2, _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2) );
            _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4);
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_R_4_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.r;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_G_5_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.g;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_B_6_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.b;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_A_7_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float;
            Unity_Add_half(_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float, half(-0.5), _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float;
            Unity_Multiply_half_half(_Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float, 2, _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float;
            Unity_Absolute_half(_Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3, (_Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float.xxx), _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _SmallCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _SmallCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2, _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2, (_UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4.xy), _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[0];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[1];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_B_3_Float = 0;
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2 = half2(_Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float, _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2;
            Unity_Branch_half2(_Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean, _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2, _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2, _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _SmallCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float, _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(1), _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float.xx), _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float;
            Unity_Divide_half(half(1), _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float, _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, (_UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4.xy), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float.xx), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2;
            Unity_Add_half2(_Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _SmallCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(0.5), _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float.xx), _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2, _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4);
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_R_4_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.r;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_G_5_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.g;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_B_6_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.b;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_A_7_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float;
            Unity_Add_half(_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float, half(-0.5), _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float;
            Unity_Multiply_half_half(_Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float, 2, _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float;
            Unity_Absolute_half(_Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3, (_Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float.xxx), _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_e8815c5687c0c188b222e57b486e0e5d_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _SmallCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float;
            Unity_Divide_half(_Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float, half(45), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float;
            Unity_OneMinus_half(_Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float;
            Unity_Subtract_half(_Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float, _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float;
            Unity_Clamp_half(_Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float, half(0), half(2), _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float, _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float;
            Unity_Clamp_half(_Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float, half(0), half(1), _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float;
            Unity_OneMinus_half(_Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float, _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float;
            Unity_Absolute_half(_OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float, _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _SmallCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float;
            Unity_Absolute_half(_Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float, _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float;
            Unity_Clamp_half(_Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float, half(0), half(1), _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6975119070a7eb84950e7da691463776_Out_0_Float = _BigCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float;
            Unity_Divide_half(_Property_6975119070a7eb84950e7da691463776_Out_0_Float, half(45), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float;
            Unity_OneMinus_half(_Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float;
            Unity_Subtract_half(_Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float, _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float;
            Unity_Clamp_half(_Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float, half(0), half(2), _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float, _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float;
            Unity_Clamp_half(_Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float, half(0), half(1), _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float;
            Unity_OneMinus_half(_Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float, _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float;
            Unity_Absolute_half(_OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float, _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float = _BigCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float;
            Unity_Power_half(_Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float, _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float, _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float;
            Unity_Clamp_half(_Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float, half(0), half(1), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float;
            Unity_Subtract_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2 = _BigCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2 = _BigCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2, _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_8773728161068380a52b4e181688e112_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2, (_UV_8773728161068380a52b4e181688e112_Out_0_Vector4.xy), _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[0];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[1];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_B_3_Float = 0;
            half _Split_1be1e5da5681728eb25e1e0354a56de2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2 = half2(_Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float, _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2;
            Unity_Branch_half2(_Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean, _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2, _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2, _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float = _BigCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float, _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(1), _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float;
            Unity_Fraction_half(_Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float, _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float.xx), _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float;
            Unity_Divide_half(half(1), _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float, _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, (_UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4.xy), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float.xx), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2;
            Unity_Add_half2(_Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4);
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_R_4_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.r;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_G_5_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.g;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_B_6_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.b;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_A_7_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float = _BigCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(0.5), _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float;
            Unity_Fraction_half(_Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float, _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float.xx), _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2;
            Unity_Add_half2(_Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2, _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4);
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_R_4_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.r;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_G_5_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.g;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_B_6_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.b;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_A_7_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float;
            Unity_Add_half(_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float, half(-0.5), _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float;
            Unity_Multiply_half_half(_Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float, 2, _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float;
            Unity_Absolute_half(_Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3, (_Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float.xxx), _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3, (_Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float.xxx), _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3, _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[2];
            half _Split_68246b194708098988894c52ed841038_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4;
            half3 _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3;
            half2 _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2;
            Unity_Combine_half(_Split_68246b194708098988894c52ed841038_R_1_Float, _Split_68246b194708098988894c52ed841038_G_2_Float, half(0), half(0), _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4, _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3, _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Property_7be063d957af468180e6d5402ca51556_Out_0_Float.xx), _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2, _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2, _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2, 0.0, 1.0)), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float;
            Unity_Absolute_half(_Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float, _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float = _ShalowFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float;
            Unity_Multiply_half_half(_Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float, -1, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float;
            Unity_Power_half(_Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float, _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _BigCascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float;
            Unity_Lerp_half(_Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float, half(100), _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float, _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float;
            Unity_Saturate_half(_Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float, _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float;
            Unity_Clamp_half(_Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float, half(0), half(1), _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4;
            Unity_Lerp_half4(_Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4, _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4, (_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float.xxxx), _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float, _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float;
            Unity_Clamp_half(_Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float, half(0), half(1), _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float;
            Unity_Power_half(_Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float, _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float, _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float;
            Unity_Clamp_half(_Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float, half(0), half(1), _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float.xxx), _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float = _CleanFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float;
            Unity_Power_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float, _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float;
            Unity_Clamp_half(_Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float, half(0), half(1), _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            #else
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4 = _FoamColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float = _FoamDepth;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float, _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float;
            Unity_Absolute_half(_Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float, _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float = _FoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float;
            Unity_Power_half(_Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float, _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float, _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float;
            Unity_Saturate_half(_Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float, _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2 = _FoamSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2 = _FoamTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2, _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2, (_UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4.xy), _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_ae6014510e633681b63895fb895fb552_R_1_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[0];
            half _Split_ae6014510e633681b63895fb895fb552_G_2_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[1];
            half _Split_ae6014510e633681b63895fb895fb552_B_3_Float = 0;
            half _Split_ae6014510e633681b63895fb895fb552_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2 = half2(_Split_ae6014510e633681b63895fb895fb552_G_2_Float, _Split_ae6014510e633681b63895fb895fb552_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2;
            Unity_Branch_half2(_Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean, _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2, _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2, _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float;
            Unity_Divide_half(half(1), _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float, _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, (_UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4.xy), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float.xx), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_094898c3a8179686900646a49173411c_Out_2_Vector2;
            Unity_Add_half2(_Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Add_094898c3a8179686900646a49173411c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_094898c3a8179686900646a49173411c_Out_2_Vector2) );
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_R_4_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.r;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_G_5_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.g;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.b;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_A_7_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2;
            Unity_Add_half2(_Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2, _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2) );
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_R_4_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.r;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_G_5_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.g;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.b;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_A_7_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float, _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float;
            Unity_Multiply_half_half(_Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float, _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float;
            Unity_Lerp_half(_Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float, half(0), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float;
            Unity_Clamp_half(_Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float, half(0), half(1), _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3, (_Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4.xyz), (_Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float.xxx), _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2 = _NoiseTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2, (_UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4.xy), _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_531c539071350e8587150bda75bbea54_R_1_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[0];
            half _Split_531c539071350e8587150bda75bbea54_G_2_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[1];
            half _Split_531c539071350e8587150bda75bbea54_B_3_Float = 0;
            half _Split_531c539071350e8587150bda75bbea54_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2 = half2(_Split_531c539071350e8587150bda75bbea54_G_2_Float, _Split_531c539071350e8587150bda75bbea54_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2;
            Unity_Branch_half2(_Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean, _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2, _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2, _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_2a70658053db97858286624babe5442d_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_2a70658053db97858286624babe5442d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_2a70658053db97858286624babe5442d_Out_1_Float.xx), _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6907e5604f833889014e993d4afa562_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e6907e5604f833889014e993d4afa562_Out_0_Float, _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, (_UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4.xy), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float.xx), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2;
            Unity_Add_half2(_Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2) );
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_R_4_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_G_5_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_B_6_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float.xx), _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2;
            Unity_Add_half2(_Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2, _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2) );
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_R_4_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.r;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_G_5_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.g;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_B_6_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.b;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float, _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float;
            Unity_Absolute_half(_Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float, _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _SmallCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _SmallCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float;
            Unity_Multiply_half_half(_Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float, _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float, _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float;
            Unity_Clamp_half(_Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float, half(0), half(1), _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4 = _SmallCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxxx), _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float;
            Unity_Absolute_half(_Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float = _SmallCascadeFoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float;
            Unity_Power_half(_Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float, _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float, _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float;
            Unity_Clamp_half(_Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float, half(0), half(1), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_R_4_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.r;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.g;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_B_6_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.b;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_A_7_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_R_4_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.r;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.g;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_B_6_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.b;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_A_7_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float, _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float;
            Unity_Multiply_half_half(0.5, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float = _BigCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float, _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float = _BigCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float;
            Unity_Multiply_half_half(_Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float, _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float, _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float;
            Unity_Clamp_half(_Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float, half(0), half(1), _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float;
            Unity_Lerp_half(_Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float, _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4 = _BigCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float.xxxx), _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4, _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float;
            Unity_Absolute_half(_Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float = Big_Cascade_Foam_Falloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float;
            Unity_Power_half(_Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float, _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float, _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float;
            Unity_Clamp_half(_Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float, half(0), half(1), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3, (_Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4.xyz), (_Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float.xxx), _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ecb45bb303cac58eae00f7c993f09940_Out_0_Float = _OutlinePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float;
            Unity_OneMinus_half(_Property_ecb45bb303cac58eae00f7c993f09940_Out_0_Float, _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_c939729fdee6708588027553e218ba19_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float, _Add_c939729fdee6708588027553e218ba19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float;
            Unity_Absolute_half(_Add_c939729fdee6708588027553e218ba19_Out_2_Float, _Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_19154a94d29d5f8b8b86eb5e6f4991bc_Out_0_Float = _OutlineFalloffBorder;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float;
            Unity_OneMinus_half(_Property_19154a94d29d5f8b8b86eb5e6f4991bc_Out_0_Float, _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float;
            Unity_Power_half(_Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float, _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float, _Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float;
            Unity_Clamp_half(_Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float, half(0), half(1), _Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0d3d1077552b628ab7275bfdcc21c962_Out_0_Vector4 = _Outline_Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float.xxxx), _Property_0d3d1077552b628ab7275bfdcc21c962_Out_0_Vector4, _Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4, (_Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float.xxxx), _Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a50bc756bdaaf78fb4a8759365ee5fae_Out_0_Float = _WaterSpecularFar;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3a30fb0641692583bcafa451888182da_Out_0_Float = _WaterSpecularClose;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_123656d8e933d685ad1ede33a116e6b1_Out_1_Float;
            Unity_Absolute_half(_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float, _Absolute_123656d8e933d685ad1ede33a116e6b1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2aef0aceee365782be4a5722bba663ab_Out_0_Float = _WaterSpecularThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_e805987c09a2df85a4b14d4be7a93d06_Out_2_Float;
            Unity_Power_half(_Absolute_123656d8e933d685ad1ede33a116e6b1_Out_1_Float, _Property_2aef0aceee365782be4a5722bba663ab_Out_0_Float, _Power_e805987c09a2df85a4b14d4be7a93d06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_560dfe6ed2d17f8da854e76b77def53d_Out_3_Float;
            Unity_Lerp_half(_Property_a50bc756bdaaf78fb4a8759365ee5fae_Out_0_Float, _Property_3a30fb0641692583bcafa451888182da_Out_0_Float, _Power_e805987c09a2df85a4b14d4be7a93d06_Out_2_Float, _Lerp_560dfe6ed2d17f8da854e76b77def53d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fb76d0389787a28bb2443f09d9edaabb_Out_0_Float = _FoamSpecular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_6d18e36ae8e5ea8895030087cc10a76a_Out_3_Float;
            Unity_Lerp_half(_Lerp_560dfe6ed2d17f8da854e76b77def53d_Out_3_Float, _Property_fb76d0389787a28bb2443f09d9edaabb_Out_0_Float, _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float, _Lerp_6d18e36ae8e5ea8895030087cc10a76a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6bd188411b5d548a9d56cc14b3674c43_Out_0_Float = _SmallCascadeSpecular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_b301e6d0a99d7088b122cebd11611127_Out_3_Float;
            Unity_Lerp_half(_Lerp_6d18e36ae8e5ea8895030087cc10a76a_Out_3_Float, _Property_6bd188411b5d548a9d56cc14b3674c43_Out_0_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float, _Lerp_b301e6d0a99d7088b122cebd11611127_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9e0f5550104cb288aef28d10e66cbc71_Out_0_Float = _BigCascadeSpecular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_4be29bffa6eca287ad3854ebde28c953_Out_3_Float;
            Unity_Lerp_half(_Lerp_b301e6d0a99d7088b122cebd11611127_Out_3_Float, _Property_9e0f5550104cb288aef28d10e66cbc71_Out_0_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float, _Lerp_4be29bffa6eca287ad3854ebde28c953_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float = _WaterSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_baa3b3197ad6578199dc2da57e79bc4c_Out_0_Float = _FoamSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_35f90fcebe5a9481a5c0f41845b5239d_Out_3_Float;
            Unity_Lerp_half(_Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float, _Property_baa3b3197ad6578199dc2da57e79bc4c_Out_0_Float, _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float, _Lerp_35f90fcebe5a9481a5c0f41845b5239d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float = _SmallCascadeSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float;
            Unity_Lerp_half(_Lerp_35f90fcebe5a9481a5c0f41845b5239d_Out_3_Float, _Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float, _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_94efdcfe3a5a998bb3b399b34d6110a5_Out_0_Float = _BigCascadeSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_b93c8d58d001c08e84a1ed16444c27c9_Out_3_Float;
            Unity_Lerp_half(_Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float, _Property_94efdcfe3a5a998bb3b399b34d6110a5_Out_0_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float, _Lerp_b93c8d58d001c08e84a1ed16444c27c9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float = _AOPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.BaseColor = _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            surface.NormalTS = _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            surface.Emission = (_Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4.xyz);
            surface.Metallic = half(0);
            surface.Specular = (_Lerp_4be29bffa6eca287ad3854ebde28c953_Out_3_Float.xxx);
            surface.Smoothness = _Lerp_b93c8d58d001c08e84a1ed16444c27c9_Out_3_Float;
            surface.Occlusion = _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float;
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv3 = input.texCoord3;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        #endif
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "GBuffer"
            Tags
            {
                "LightMode" = "UniversalGBuffer"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 4.5
        #pragma exclude_renderers gles3 glcore
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ USE_LEGACY_LIGHTMAPS
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
        #pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma shader_feature_fragment _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local_fragment _ _ALPHAPREMULTIPLY_ON
        #pragma shader_feature_local_fragment _ _ALPHAMODULATE_ON
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local_fragment _ _SPECULAR_SETUP
        #pragma shader_feature_local _ _RECEIVE_SHADOWS_OFF
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_SHADOW_COORD
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_GBUFFER
        #define _FOG_FRAGMENT 1
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_OPAQUE_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3 : TEXCOORD3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord;
            #endif
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TangentSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TimeParameters;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV : INTERP0;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh : INTERP2;
            #endif
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord : INTERP3;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP5;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3 : INTERP6;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP7;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight : INTERP8;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP9;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP10;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord3 = input.texCoord3.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Multiply_half2_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Branch_half2(half Predicate, half2 True, half2 False, out half2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_half(half A, half B, out half Out)
        {
            Out = A + B;
        }
        
        void Unity_Fraction_half(half In, out half Out)
        {
            Out = frac(In);
        }
        
        void Unity_Divide_half(half A, half B, out half Out)
        {
            Out = A / B;
        }
        
        void Unity_Add_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A + B;
        }
        
        void Unity_NormalStrength_half(half3 In, half Strength, out half3 Out)
        {
            Out = half3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Lerp_half3(half3 A, half3 B, half3 T, out half3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Normalize_half3(half3 In, out half3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Combine_half(half R, half G, half B, half A, out half4 RGBA, out half3 RGB, out half2 RG)
        {
            RGBA = half4(R, G, B, A);
            RGB = half3(R, G, B);
            RG = half2(R, G);
        }
        
        void Unity_SceneColor_half(half4 UV, out half3 Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_COLOR(UV.xy);
        }
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Multiply_half3_half3(half3 A, half3 B, out half3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Multiply_half4_half4(half4 A, half4 B, out half4 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half3 BaseColor;
            half3 NormalTS;
            half3 Emission;
            half Metallic;
            half3 Specular;
            half Smoothness;
            half Occlusion;
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7be063d957af468180e6d5402ca51556_Out_0_Float = _Distortion;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2 = _SlowWaterSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2 = _SlowWaterTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2, _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2, (_UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4.xy), _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[0];
            half _Split_3275572cd890568f980cafc7c60f69f9_G_2_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[1];
            half _Split_3275572cd890568f980cafc7c60f69f9_B_3_Float = 0;
            half _Split_3275572cd890568f980cafc7c60f69f9_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2 = half2(_Split_3275572cd890568f980cafc7c60f69f9_G_2_Float, _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2;
            Unity_Branch_half2(_Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean, _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2, _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2, _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float = _WaterFlowUVRefresSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float, _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(1), _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float;
            Unity_Fraction_half(_Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float, _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float;
            Unity_Divide_half(half(1), _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float, _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, (_UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4.xy), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float.xx), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2) );
            _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4);
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_R_4_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.r;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_G_5_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.g;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_B_6_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.b;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_A_7_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_30c36922aabc618192374556ee8ce299_Out_0_Float = _SlowNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(0.5), _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float;
            Unity_Fraction_half(_Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float, _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2;
            Unity_Add_half2(_Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2, _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2) );
            _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4);
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_R_4_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.r;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_G_5_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.g;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_B_6_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.b;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_A_7_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float;
            Unity_Add_half(_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float, half(-0.5), _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float;
            Unity_Multiply_half_half(_Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float, 2, _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float;
            Unity_Absolute_half(_Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3, (_Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float.xxx), _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _SmallCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _SmallCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2, _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2, (_UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4.xy), _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[0];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[1];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_B_3_Float = 0;
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2 = half2(_Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float, _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2;
            Unity_Branch_half2(_Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean, _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2, _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2, _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _SmallCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float, _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(1), _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float.xx), _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float;
            Unity_Divide_half(half(1), _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float, _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, (_UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4.xy), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float.xx), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2;
            Unity_Add_half2(_Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _SmallCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(0.5), _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float.xx), _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2, _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4);
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_R_4_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.r;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_G_5_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.g;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_B_6_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.b;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_A_7_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float;
            Unity_Add_half(_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float, half(-0.5), _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float;
            Unity_Multiply_half_half(_Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float, 2, _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float;
            Unity_Absolute_half(_Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3, (_Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float.xxx), _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_e8815c5687c0c188b222e57b486e0e5d_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _SmallCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float;
            Unity_Divide_half(_Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float, half(45), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float;
            Unity_OneMinus_half(_Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float;
            Unity_Subtract_half(_Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float, _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float;
            Unity_Clamp_half(_Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float, half(0), half(2), _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float, _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float;
            Unity_Clamp_half(_Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float, half(0), half(1), _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float;
            Unity_OneMinus_half(_Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float, _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float;
            Unity_Absolute_half(_OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float, _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _SmallCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float;
            Unity_Absolute_half(_Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float, _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float;
            Unity_Clamp_half(_Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float, half(0), half(1), _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6975119070a7eb84950e7da691463776_Out_0_Float = _BigCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float;
            Unity_Divide_half(_Property_6975119070a7eb84950e7da691463776_Out_0_Float, half(45), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float;
            Unity_OneMinus_half(_Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float;
            Unity_Subtract_half(_Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float, _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float;
            Unity_Clamp_half(_Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float, half(0), half(2), _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float, _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float;
            Unity_Clamp_half(_Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float, half(0), half(1), _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float;
            Unity_OneMinus_half(_Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float, _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float;
            Unity_Absolute_half(_OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float, _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float = _BigCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float;
            Unity_Power_half(_Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float, _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float, _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float;
            Unity_Clamp_half(_Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float, half(0), half(1), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float;
            Unity_Subtract_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2 = _BigCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2 = _BigCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2, _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_8773728161068380a52b4e181688e112_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2, (_UV_8773728161068380a52b4e181688e112_Out_0_Vector4.xy), _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[0];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[1];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_B_3_Float = 0;
            half _Split_1be1e5da5681728eb25e1e0354a56de2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2 = half2(_Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float, _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2;
            Unity_Branch_half2(_Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean, _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2, _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2, _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float = _BigCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float, _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(1), _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float;
            Unity_Fraction_half(_Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float, _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float.xx), _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float;
            Unity_Divide_half(half(1), _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float, _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, (_UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4.xy), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float.xx), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2;
            Unity_Add_half2(_Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4);
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_R_4_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.r;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_G_5_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.g;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_B_6_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.b;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_A_7_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float = _BigCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(0.5), _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float;
            Unity_Fraction_half(_Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float, _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float.xx), _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2;
            Unity_Add_half2(_Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2, _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4);
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_R_4_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.r;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_G_5_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.g;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_B_6_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.b;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_A_7_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float;
            Unity_Add_half(_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float, half(-0.5), _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float;
            Unity_Multiply_half_half(_Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float, 2, _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float;
            Unity_Absolute_half(_Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3, (_Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float.xxx), _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3, (_Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float.xxx), _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3, _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[2];
            half _Split_68246b194708098988894c52ed841038_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4;
            half3 _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3;
            half2 _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2;
            Unity_Combine_half(_Split_68246b194708098988894c52ed841038_R_1_Float, _Split_68246b194708098988894c52ed841038_G_2_Float, half(0), half(0), _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4, _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3, _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Property_7be063d957af468180e6d5402ca51556_Out_0_Float.xx), _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2, _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2, _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2, 0.0, 1.0)), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float;
            Unity_Absolute_half(_Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float, _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float = _ShalowFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float;
            Unity_Multiply_half_half(_Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float, -1, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float;
            Unity_Power_half(_Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float, _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _BigCascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float;
            Unity_Lerp_half(_Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float, half(100), _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float, _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float;
            Unity_Saturate_half(_Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float, _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float;
            Unity_Clamp_half(_Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float, half(0), half(1), _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4;
            Unity_Lerp_half4(_Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4, _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4, (_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float.xxxx), _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float, _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float;
            Unity_Clamp_half(_Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float, half(0), half(1), _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float;
            Unity_Power_half(_Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float, _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float, _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float;
            Unity_Clamp_half(_Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float, half(0), half(1), _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float.xxx), _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float = _CleanFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float;
            Unity_Power_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float, _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float;
            Unity_Clamp_half(_Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float, half(0), half(1), _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            #else
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4 = _FoamColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float = _FoamDepth;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float, _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float;
            Unity_Absolute_half(_Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float, _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float = _FoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float;
            Unity_Power_half(_Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float, _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float, _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float;
            Unity_Saturate_half(_Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float, _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2 = _FoamSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2 = _FoamTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2, _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2, (_UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4.xy), _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_ae6014510e633681b63895fb895fb552_R_1_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[0];
            half _Split_ae6014510e633681b63895fb895fb552_G_2_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[1];
            half _Split_ae6014510e633681b63895fb895fb552_B_3_Float = 0;
            half _Split_ae6014510e633681b63895fb895fb552_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2 = half2(_Split_ae6014510e633681b63895fb895fb552_G_2_Float, _Split_ae6014510e633681b63895fb895fb552_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2;
            Unity_Branch_half2(_Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean, _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2, _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2, _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float;
            Unity_Divide_half(half(1), _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float, _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, (_UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4.xy), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float.xx), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_094898c3a8179686900646a49173411c_Out_2_Vector2;
            Unity_Add_half2(_Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Add_094898c3a8179686900646a49173411c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_094898c3a8179686900646a49173411c_Out_2_Vector2) );
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_R_4_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.r;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_G_5_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.g;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.b;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_A_7_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2;
            Unity_Add_half2(_Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2, _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2) );
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_R_4_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.r;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_G_5_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.g;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.b;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_A_7_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float, _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float;
            Unity_Multiply_half_half(_Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float, _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float;
            Unity_Lerp_half(_Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float, half(0), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float;
            Unity_Clamp_half(_Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float, half(0), half(1), _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3, (_Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4.xyz), (_Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float.xxx), _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2 = _NoiseTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2, (_UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4.xy), _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_531c539071350e8587150bda75bbea54_R_1_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[0];
            half _Split_531c539071350e8587150bda75bbea54_G_2_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[1];
            half _Split_531c539071350e8587150bda75bbea54_B_3_Float = 0;
            half _Split_531c539071350e8587150bda75bbea54_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2 = half2(_Split_531c539071350e8587150bda75bbea54_G_2_Float, _Split_531c539071350e8587150bda75bbea54_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2;
            Unity_Branch_half2(_Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean, _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2, _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2, _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_2a70658053db97858286624babe5442d_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_2a70658053db97858286624babe5442d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_2a70658053db97858286624babe5442d_Out_1_Float.xx), _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6907e5604f833889014e993d4afa562_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e6907e5604f833889014e993d4afa562_Out_0_Float, _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, (_UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4.xy), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float.xx), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2;
            Unity_Add_half2(_Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2) );
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_R_4_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_G_5_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_B_6_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float.xx), _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2;
            Unity_Add_half2(_Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2, _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2) );
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_R_4_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.r;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_G_5_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.g;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_B_6_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.b;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float, _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float;
            Unity_Absolute_half(_Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float, _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _SmallCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _SmallCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float;
            Unity_Multiply_half_half(_Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float, _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float, _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float;
            Unity_Clamp_half(_Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float, half(0), half(1), _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4 = _SmallCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxxx), _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float;
            Unity_Absolute_half(_Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float = _SmallCascadeFoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float;
            Unity_Power_half(_Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float, _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float, _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float;
            Unity_Clamp_half(_Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float, half(0), half(1), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_R_4_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.r;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.g;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_B_6_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.b;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_A_7_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_R_4_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.r;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.g;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_B_6_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.b;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_A_7_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float, _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float;
            Unity_Multiply_half_half(0.5, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float = _BigCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float, _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float = _BigCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float;
            Unity_Multiply_half_half(_Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float, _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float, _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float;
            Unity_Clamp_half(_Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float, half(0), half(1), _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float;
            Unity_Lerp_half(_Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float, _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4 = _BigCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float.xxxx), _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4, _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float;
            Unity_Absolute_half(_Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float = Big_Cascade_Foam_Falloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float;
            Unity_Power_half(_Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float, _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float, _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float;
            Unity_Clamp_half(_Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float, half(0), half(1), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3, (_Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4.xyz), (_Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float.xxx), _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ecb45bb303cac58eae00f7c993f09940_Out_0_Float = _OutlinePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float;
            Unity_OneMinus_half(_Property_ecb45bb303cac58eae00f7c993f09940_Out_0_Float, _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_c939729fdee6708588027553e218ba19_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float, _Add_c939729fdee6708588027553e218ba19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float;
            Unity_Absolute_half(_Add_c939729fdee6708588027553e218ba19_Out_2_Float, _Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_19154a94d29d5f8b8b86eb5e6f4991bc_Out_0_Float = _OutlineFalloffBorder;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float;
            Unity_OneMinus_half(_Property_19154a94d29d5f8b8b86eb5e6f4991bc_Out_0_Float, _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float;
            Unity_Power_half(_Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float, _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float, _Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float;
            Unity_Clamp_half(_Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float, half(0), half(1), _Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0d3d1077552b628ab7275bfdcc21c962_Out_0_Vector4 = _Outline_Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float.xxxx), _Property_0d3d1077552b628ab7275bfdcc21c962_Out_0_Vector4, _Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4, (_Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float.xxxx), _Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a50bc756bdaaf78fb4a8759365ee5fae_Out_0_Float = _WaterSpecularFar;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3a30fb0641692583bcafa451888182da_Out_0_Float = _WaterSpecularClose;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_123656d8e933d685ad1ede33a116e6b1_Out_1_Float;
            Unity_Absolute_half(_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float, _Absolute_123656d8e933d685ad1ede33a116e6b1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2aef0aceee365782be4a5722bba663ab_Out_0_Float = _WaterSpecularThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_e805987c09a2df85a4b14d4be7a93d06_Out_2_Float;
            Unity_Power_half(_Absolute_123656d8e933d685ad1ede33a116e6b1_Out_1_Float, _Property_2aef0aceee365782be4a5722bba663ab_Out_0_Float, _Power_e805987c09a2df85a4b14d4be7a93d06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_560dfe6ed2d17f8da854e76b77def53d_Out_3_Float;
            Unity_Lerp_half(_Property_a50bc756bdaaf78fb4a8759365ee5fae_Out_0_Float, _Property_3a30fb0641692583bcafa451888182da_Out_0_Float, _Power_e805987c09a2df85a4b14d4be7a93d06_Out_2_Float, _Lerp_560dfe6ed2d17f8da854e76b77def53d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fb76d0389787a28bb2443f09d9edaabb_Out_0_Float = _FoamSpecular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_6d18e36ae8e5ea8895030087cc10a76a_Out_3_Float;
            Unity_Lerp_half(_Lerp_560dfe6ed2d17f8da854e76b77def53d_Out_3_Float, _Property_fb76d0389787a28bb2443f09d9edaabb_Out_0_Float, _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float, _Lerp_6d18e36ae8e5ea8895030087cc10a76a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6bd188411b5d548a9d56cc14b3674c43_Out_0_Float = _SmallCascadeSpecular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_b301e6d0a99d7088b122cebd11611127_Out_3_Float;
            Unity_Lerp_half(_Lerp_6d18e36ae8e5ea8895030087cc10a76a_Out_3_Float, _Property_6bd188411b5d548a9d56cc14b3674c43_Out_0_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float, _Lerp_b301e6d0a99d7088b122cebd11611127_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9e0f5550104cb288aef28d10e66cbc71_Out_0_Float = _BigCascadeSpecular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_4be29bffa6eca287ad3854ebde28c953_Out_3_Float;
            Unity_Lerp_half(_Lerp_b301e6d0a99d7088b122cebd11611127_Out_3_Float, _Property_9e0f5550104cb288aef28d10e66cbc71_Out_0_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float, _Lerp_4be29bffa6eca287ad3854ebde28c953_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float = _WaterSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_baa3b3197ad6578199dc2da57e79bc4c_Out_0_Float = _FoamSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_35f90fcebe5a9481a5c0f41845b5239d_Out_3_Float;
            Unity_Lerp_half(_Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float, _Property_baa3b3197ad6578199dc2da57e79bc4c_Out_0_Float, _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float, _Lerp_35f90fcebe5a9481a5c0f41845b5239d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float = _SmallCascadeSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float;
            Unity_Lerp_half(_Lerp_35f90fcebe5a9481a5c0f41845b5239d_Out_3_Float, _Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float, _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_94efdcfe3a5a998bb3b399b34d6110a5_Out_0_Float = _BigCascadeSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_b93c8d58d001c08e84a1ed16444c27c9_Out_3_Float;
            Unity_Lerp_half(_Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float, _Property_94efdcfe3a5a998bb3b399b34d6110a5_Out_0_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float, _Lerp_b93c8d58d001c08e84a1ed16444c27c9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float = _AOPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.BaseColor = _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            surface.NormalTS = _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            surface.Emission = (_Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4.xyz);
            surface.Metallic = half(0);
            surface.Specular = (_Lerp_4be29bffa6eca287ad3854ebde28c953_Out_3_Float.xxx);
            surface.Smoothness = _Lerp_b93c8d58d001c08e84a1ed16444c27c9_Out_3_Float;
            surface.Occlusion = _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float;
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv3 = input.texCoord3;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        #endif
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask 0
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_SHADOWCASTER
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
        Out = A * B;
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "MotionVectors"
            Tags
            {
                "LightMode" = "MotionVectors"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask RG
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 3.5
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_MOTION_VECTORS
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP1;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
        Out = A * B;
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/MotionVectorPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthOnly"
            Tags
            {
                "LightMode" = "DepthOnly"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask R
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP1;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
        Out = A * B;
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthNormals"
            Tags
            {
                "LightMode" = "DepthNormals"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHNORMALS
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3 : TEXCOORD3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TangentSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TimeParameters;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3 : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP5;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord3 = input.texCoord3.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Multiply_half2_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Branch_half2(half Predicate, half2 True, half2 False, out half2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_half(half A, half B, out half Out)
        {
            Out = A + B;
        }
        
        void Unity_Fraction_half(half In, out half Out)
        {
            Out = frac(In);
        }
        
        void Unity_Divide_half(half A, half B, out half Out)
        {
            Out = A / B;
        }
        
        void Unity_Add_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A + B;
        }
        
        void Unity_NormalStrength_half(half3 In, half Strength, out half3 Out)
        {
            Out = half3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Lerp_half3(half3 A, half3 B, half3 T, out half3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half3 NormalTS;
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2 = _SlowWaterSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2 = _SlowWaterTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2, _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2, (_UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4.xy), _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[0];
            half _Split_3275572cd890568f980cafc7c60f69f9_G_2_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[1];
            half _Split_3275572cd890568f980cafc7c60f69f9_B_3_Float = 0;
            half _Split_3275572cd890568f980cafc7c60f69f9_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2 = half2(_Split_3275572cd890568f980cafc7c60f69f9_G_2_Float, _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2;
            Unity_Branch_half2(_Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean, _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2, _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2, _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float = _WaterFlowUVRefresSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float, _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(1), _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float;
            Unity_Fraction_half(_Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float, _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float;
            Unity_Divide_half(half(1), _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float, _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, (_UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4.xy), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float.xx), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2) );
            _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4);
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_R_4_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.r;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_G_5_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.g;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_B_6_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.b;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_A_7_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_30c36922aabc618192374556ee8ce299_Out_0_Float = _SlowNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(0.5), _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float;
            Unity_Fraction_half(_Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float, _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2;
            Unity_Add_half2(_Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2, _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2) );
            _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4);
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_R_4_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.r;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_G_5_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.g;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_B_6_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.b;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_A_7_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float;
            Unity_Add_half(_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float, half(-0.5), _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float;
            Unity_Multiply_half_half(_Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float, 2, _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float;
            Unity_Absolute_half(_Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3, (_Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float.xxx), _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _SmallCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _SmallCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2, _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2, (_UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4.xy), _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[0];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[1];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_B_3_Float = 0;
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2 = half2(_Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float, _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2;
            Unity_Branch_half2(_Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean, _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2, _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2, _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _SmallCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float, _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(1), _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float.xx), _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float;
            Unity_Divide_half(half(1), _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float, _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, (_UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4.xy), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float.xx), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2;
            Unity_Add_half2(_Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _SmallCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(0.5), _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float.xx), _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2, _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4);
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_R_4_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.r;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_G_5_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.g;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_B_6_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.b;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_A_7_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float;
            Unity_Add_half(_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float, half(-0.5), _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float;
            Unity_Multiply_half_half(_Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float, 2, _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float;
            Unity_Absolute_half(_Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3, (_Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float.xxx), _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_e8815c5687c0c188b222e57b486e0e5d_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _SmallCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float;
            Unity_Divide_half(_Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float, half(45), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float;
            Unity_OneMinus_half(_Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float;
            Unity_Subtract_half(_Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float, _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float;
            Unity_Clamp_half(_Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float, half(0), half(2), _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float, _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float;
            Unity_Clamp_half(_Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float, half(0), half(1), _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float;
            Unity_OneMinus_half(_Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float, _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float;
            Unity_Absolute_half(_OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float, _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _SmallCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float;
            Unity_Absolute_half(_Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float, _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float;
            Unity_Clamp_half(_Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float, half(0), half(1), _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6975119070a7eb84950e7da691463776_Out_0_Float = _BigCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float;
            Unity_Divide_half(_Property_6975119070a7eb84950e7da691463776_Out_0_Float, half(45), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float;
            Unity_OneMinus_half(_Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float;
            Unity_Subtract_half(_Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float, _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float;
            Unity_Clamp_half(_Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float, half(0), half(2), _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float, _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float;
            Unity_Clamp_half(_Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float, half(0), half(1), _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float;
            Unity_OneMinus_half(_Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float, _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float;
            Unity_Absolute_half(_OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float, _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float = _BigCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float;
            Unity_Power_half(_Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float, _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float, _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float;
            Unity_Clamp_half(_Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float, half(0), half(1), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float;
            Unity_Subtract_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2 = _BigCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2 = _BigCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2, _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_8773728161068380a52b4e181688e112_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2, (_UV_8773728161068380a52b4e181688e112_Out_0_Vector4.xy), _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[0];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[1];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_B_3_Float = 0;
            half _Split_1be1e5da5681728eb25e1e0354a56de2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2 = half2(_Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float, _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2;
            Unity_Branch_half2(_Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean, _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2, _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2, _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float = _BigCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float, _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(1), _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float;
            Unity_Fraction_half(_Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float, _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float.xx), _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float;
            Unity_Divide_half(half(1), _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float, _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, (_UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4.xy), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float.xx), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2;
            Unity_Add_half2(_Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4);
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_R_4_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.r;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_G_5_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.g;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_B_6_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.b;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_A_7_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float = _BigCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(0.5), _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float;
            Unity_Fraction_half(_Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float, _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float.xx), _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2;
            Unity_Add_half2(_Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2, _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4);
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_R_4_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.r;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_G_5_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.g;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_B_6_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.b;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_A_7_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float;
            Unity_Add_half(_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float, half(-0.5), _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float;
            Unity_Multiply_half_half(_Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float, 2, _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float;
            Unity_Absolute_half(_Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3, (_Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float.xxx), _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3, (_Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float.xxx), _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.NormalTS = _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv3 = input.texCoord3;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        #endif
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "Meta"
            Tags
            {
                "LightMode" = "Meta"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature _ EDITOR_VISUALIZATION
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_INSTANCEID
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_META
        #define _FOG_FRAGMENT 1
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_OPAQUE_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3 : TEXCOORD3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TimeParameters;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord1 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3 : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP5;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP6;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord1.xyzw = input.texCoord1;
            output.texCoord2.xyzw = input.texCoord2;
            output.texCoord3.xyzw = input.texCoord3;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord1 = input.texCoord1.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.texCoord3 = input.texCoord3.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Multiply_half2_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Branch_half2(half Predicate, half2 True, half2 False, out half2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_half(half A, half B, out half Out)
        {
            Out = A + B;
        }
        
        void Unity_Fraction_half(half In, out half Out)
        {
            Out = frac(In);
        }
        
        void Unity_Divide_half(half A, half B, out half Out)
        {
            Out = A / B;
        }
        
        void Unity_Add_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A + B;
        }
        
        void Unity_NormalStrength_half(half3 In, half Strength, out half3 Out)
        {
            Out = half3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Lerp_half3(half3 A, half3 B, half3 T, out half3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Normalize_half3(half3 In, out half3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Combine_half(half R, half G, half B, half A, out half4 RGBA, out half3 RGB, out half2 RG)
        {
            RGBA = half4(R, G, B, A);
            RGB = half3(R, G, B);
            RG = half2(R, G);
        }
        
        void Unity_SceneColor_half(half4 UV, out half3 Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_COLOR(UV.xy);
        }
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Multiply_half3_half3(half3 A, half3 B, out half3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Multiply_half4_half4(half4 A, half4 B, out half4 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half3 BaseColor;
            half3 Emission;
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7be063d957af468180e6d5402ca51556_Out_0_Float = _Distortion;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2 = _SlowWaterSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2 = _SlowWaterTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2, _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2, (_UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4.xy), _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[0];
            half _Split_3275572cd890568f980cafc7c60f69f9_G_2_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[1];
            half _Split_3275572cd890568f980cafc7c60f69f9_B_3_Float = 0;
            half _Split_3275572cd890568f980cafc7c60f69f9_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2 = half2(_Split_3275572cd890568f980cafc7c60f69f9_G_2_Float, _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2;
            Unity_Branch_half2(_Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean, _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2, _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2, _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float = _WaterFlowUVRefresSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float, _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(1), _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float;
            Unity_Fraction_half(_Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float, _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float;
            Unity_Divide_half(half(1), _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float, _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, (_UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4.xy), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float.xx), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2) );
            _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4);
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_R_4_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.r;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_G_5_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.g;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_B_6_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.b;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_A_7_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_30c36922aabc618192374556ee8ce299_Out_0_Float = _SlowNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(0.5), _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float;
            Unity_Fraction_half(_Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float, _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2;
            Unity_Add_half2(_Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2, _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2) );
            _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4);
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_R_4_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.r;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_G_5_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.g;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_B_6_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.b;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_A_7_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float;
            Unity_Add_half(_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float, half(-0.5), _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float;
            Unity_Multiply_half_half(_Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float, 2, _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float;
            Unity_Absolute_half(_Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3, (_Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float.xxx), _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _SmallCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _SmallCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2, _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2, (_UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4.xy), _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[0];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[1];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_B_3_Float = 0;
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2 = half2(_Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float, _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2;
            Unity_Branch_half2(_Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean, _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2, _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2, _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _SmallCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float, _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(1), _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float.xx), _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float;
            Unity_Divide_half(half(1), _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float, _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, (_UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4.xy), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float.xx), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2;
            Unity_Add_half2(_Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _SmallCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(0.5), _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float.xx), _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2, _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4);
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_R_4_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.r;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_G_5_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.g;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_B_6_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.b;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_A_7_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float;
            Unity_Add_half(_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float, half(-0.5), _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float;
            Unity_Multiply_half_half(_Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float, 2, _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float;
            Unity_Absolute_half(_Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3, (_Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float.xxx), _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_e8815c5687c0c188b222e57b486e0e5d_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _SmallCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float;
            Unity_Divide_half(_Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float, half(45), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float;
            Unity_OneMinus_half(_Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float;
            Unity_Subtract_half(_Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float, _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float;
            Unity_Clamp_half(_Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float, half(0), half(2), _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float, _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float;
            Unity_Clamp_half(_Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float, half(0), half(1), _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float;
            Unity_OneMinus_half(_Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float, _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float;
            Unity_Absolute_half(_OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float, _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _SmallCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float;
            Unity_Absolute_half(_Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float, _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float;
            Unity_Clamp_half(_Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float, half(0), half(1), _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6975119070a7eb84950e7da691463776_Out_0_Float = _BigCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float;
            Unity_Divide_half(_Property_6975119070a7eb84950e7da691463776_Out_0_Float, half(45), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float;
            Unity_OneMinus_half(_Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float;
            Unity_Subtract_half(_Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float, _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float;
            Unity_Clamp_half(_Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float, half(0), half(2), _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float, _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float;
            Unity_Clamp_half(_Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float, half(0), half(1), _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float;
            Unity_OneMinus_half(_Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float, _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float;
            Unity_Absolute_half(_OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float, _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float = _BigCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float;
            Unity_Power_half(_Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float, _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float, _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float;
            Unity_Clamp_half(_Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float, half(0), half(1), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float;
            Unity_Subtract_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2 = _BigCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2 = _BigCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2, _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_8773728161068380a52b4e181688e112_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2, (_UV_8773728161068380a52b4e181688e112_Out_0_Vector4.xy), _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[0];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[1];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_B_3_Float = 0;
            half _Split_1be1e5da5681728eb25e1e0354a56de2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2 = half2(_Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float, _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2;
            Unity_Branch_half2(_Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean, _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2, _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2, _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float = _BigCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float, _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(1), _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float;
            Unity_Fraction_half(_Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float, _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float.xx), _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float;
            Unity_Divide_half(half(1), _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float, _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, (_UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4.xy), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float.xx), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2;
            Unity_Add_half2(_Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4);
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_R_4_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.r;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_G_5_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.g;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_B_6_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.b;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_A_7_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float = _BigCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(0.5), _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float;
            Unity_Fraction_half(_Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float, _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float.xx), _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2;
            Unity_Add_half2(_Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2, _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4);
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_R_4_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.r;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_G_5_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.g;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_B_6_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.b;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_A_7_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float;
            Unity_Add_half(_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float, half(-0.5), _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float;
            Unity_Multiply_half_half(_Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float, 2, _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float;
            Unity_Absolute_half(_Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3, (_Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float.xxx), _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3, (_Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float.xxx), _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3, _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[2];
            half _Split_68246b194708098988894c52ed841038_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4;
            half3 _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3;
            half2 _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2;
            Unity_Combine_half(_Split_68246b194708098988894c52ed841038_R_1_Float, _Split_68246b194708098988894c52ed841038_G_2_Float, half(0), half(0), _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4, _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3, _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Property_7be063d957af468180e6d5402ca51556_Out_0_Float.xx), _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2, _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2, _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2, 0.0, 1.0)), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float;
            Unity_Absolute_half(_Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float, _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float = _ShalowFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float;
            Unity_Multiply_half_half(_Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float, -1, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float;
            Unity_Power_half(_Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float, _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _BigCascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float;
            Unity_Lerp_half(_Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float, half(100), _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float, _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float;
            Unity_Saturate_half(_Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float, _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float;
            Unity_Clamp_half(_Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float, half(0), half(1), _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4;
            Unity_Lerp_half4(_Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4, _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4, (_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float.xxxx), _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float, _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float;
            Unity_Clamp_half(_Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float, half(0), half(1), _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float;
            Unity_Power_half(_Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float, _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float, _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float;
            Unity_Clamp_half(_Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float, half(0), half(1), _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float.xxx), _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float = _CleanFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float;
            Unity_Power_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float, _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float;
            Unity_Clamp_half(_Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float, half(0), half(1), _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            #else
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4 = _FoamColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float = _FoamDepth;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float, _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float;
            Unity_Absolute_half(_Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float, _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float = _FoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float;
            Unity_Power_half(_Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float, _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float, _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float;
            Unity_Saturate_half(_Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float, _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2 = _FoamSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2 = _FoamTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2, _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2, (_UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4.xy), _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_ae6014510e633681b63895fb895fb552_R_1_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[0];
            half _Split_ae6014510e633681b63895fb895fb552_G_2_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[1];
            half _Split_ae6014510e633681b63895fb895fb552_B_3_Float = 0;
            half _Split_ae6014510e633681b63895fb895fb552_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2 = half2(_Split_ae6014510e633681b63895fb895fb552_G_2_Float, _Split_ae6014510e633681b63895fb895fb552_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2;
            Unity_Branch_half2(_Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean, _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2, _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2, _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float;
            Unity_Divide_half(half(1), _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float, _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, (_UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4.xy), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float.xx), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_094898c3a8179686900646a49173411c_Out_2_Vector2;
            Unity_Add_half2(_Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Add_094898c3a8179686900646a49173411c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_094898c3a8179686900646a49173411c_Out_2_Vector2) );
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_R_4_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.r;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_G_5_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.g;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.b;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_A_7_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2;
            Unity_Add_half2(_Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2, _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2) );
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_R_4_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.r;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_G_5_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.g;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.b;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_A_7_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float, _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float;
            Unity_Multiply_half_half(_Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float, _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float;
            Unity_Lerp_half(_Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float, half(0), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float;
            Unity_Clamp_half(_Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float, half(0), half(1), _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3, (_Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4.xyz), (_Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float.xxx), _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2 = _NoiseTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2, (_UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4.xy), _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_531c539071350e8587150bda75bbea54_R_1_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[0];
            half _Split_531c539071350e8587150bda75bbea54_G_2_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[1];
            half _Split_531c539071350e8587150bda75bbea54_B_3_Float = 0;
            half _Split_531c539071350e8587150bda75bbea54_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2 = half2(_Split_531c539071350e8587150bda75bbea54_G_2_Float, _Split_531c539071350e8587150bda75bbea54_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2;
            Unity_Branch_half2(_Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean, _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2, _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2, _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_2a70658053db97858286624babe5442d_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_2a70658053db97858286624babe5442d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_2a70658053db97858286624babe5442d_Out_1_Float.xx), _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6907e5604f833889014e993d4afa562_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e6907e5604f833889014e993d4afa562_Out_0_Float, _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, (_UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4.xy), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float.xx), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2;
            Unity_Add_half2(_Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2) );
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_R_4_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_G_5_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_B_6_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float.xx), _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2;
            Unity_Add_half2(_Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2, _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2) );
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_R_4_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.r;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_G_5_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.g;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_B_6_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.b;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float, _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float;
            Unity_Absolute_half(_Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float, _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _SmallCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _SmallCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float;
            Unity_Multiply_half_half(_Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float, _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float, _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float;
            Unity_Clamp_half(_Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float, half(0), half(1), _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4 = _SmallCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxxx), _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float;
            Unity_Absolute_half(_Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float = _SmallCascadeFoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float;
            Unity_Power_half(_Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float, _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float, _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float;
            Unity_Clamp_half(_Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float, half(0), half(1), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_R_4_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.r;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.g;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_B_6_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.b;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_A_7_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_R_4_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.r;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.g;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_B_6_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.b;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_A_7_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float, _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float;
            Unity_Multiply_half_half(0.5, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float = _BigCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float, _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float = _BigCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float;
            Unity_Multiply_half_half(_Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float, _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float, _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float;
            Unity_Clamp_half(_Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float, half(0), half(1), _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float;
            Unity_Lerp_half(_Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float, _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4 = _BigCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float.xxxx), _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4, _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float;
            Unity_Absolute_half(_Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float = Big_Cascade_Foam_Falloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float;
            Unity_Power_half(_Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float, _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float, _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float;
            Unity_Clamp_half(_Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float, half(0), half(1), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3, (_Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4.xyz), (_Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float.xxx), _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ecb45bb303cac58eae00f7c993f09940_Out_0_Float = _OutlinePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float;
            Unity_OneMinus_half(_Property_ecb45bb303cac58eae00f7c993f09940_Out_0_Float, _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_c939729fdee6708588027553e218ba19_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _OneMinus_4783a78975f92285a30c3d40cf7bfeb9_Out_1_Float, _Add_c939729fdee6708588027553e218ba19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float;
            Unity_Absolute_half(_Add_c939729fdee6708588027553e218ba19_Out_2_Float, _Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_19154a94d29d5f8b8b86eb5e6f4991bc_Out_0_Float = _OutlineFalloffBorder;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float;
            Unity_OneMinus_half(_Property_19154a94d29d5f8b8b86eb5e6f4991bc_Out_0_Float, _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float;
            Unity_Power_half(_Absolute_4ed351f6bf5dad8d8eee18cb76e1e01a_Out_1_Float, _OneMinus_02c7a89a6bc4768f8ea61af2132292b4_Out_1_Float, _Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float;
            Unity_Clamp_half(_Power_a7d3e5fc54a5548b93f53a347995ca69_Out_2_Float, half(0), half(1), _Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0d3d1077552b628ab7275bfdcc21c962_Out_0_Vector4 = _Outline_Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Clamp_ad281e4a78029183907629d99effad5c_Out_3_Float.xxxx), _Property_0d3d1077552b628ab7275bfdcc21c962_Out_0_Vector4, _Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Multiply_551620ffc48e9e80a73a3b0077669edd_Out_2_Vector4, (_Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float.xxxx), _Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.BaseColor = _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            surface.Emission = (_Multiply_3a9faee2eebef18db8aea72a0f553a8c_Out_2_Vector4.xyz);
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv3 = input.texCoord3;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        #endif
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "SceneSelectionPass"
            Tags
            {
                "LightMode" = "SceneSelectionPass"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENESELECTIONPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP1;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
        Out = A * B;
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ScenePickingPass"
            Tags
            {
                "LightMode" = "Picking"
            }
        
        // Render State
        Cull [_Cull]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENEPICKINGPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_OPAQUE_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3 : TEXCOORD3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TimeParameters;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP4;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord3 = input.texCoord3.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Multiply_half2_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Branch_half2(half Predicate, half2 True, half2 False, out half2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_half(half A, half B, out half Out)
        {
            Out = A + B;
        }
        
        void Unity_Fraction_half(half In, out half Out)
        {
            Out = frac(In);
        }
        
        void Unity_Divide_half(half A, half B, out half Out)
        {
            Out = A / B;
        }
        
        void Unity_Add_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A + B;
        }
        
        void Unity_NormalStrength_half(half3 In, half Strength, out half3 Out)
        {
            Out = half3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Lerp_half3(half3 A, half3 B, half3 T, out half3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Normalize_half3(half3 In, out half3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Combine_half(half R, half G, half B, half A, out half4 RGBA, out half3 RGB, out half2 RG)
        {
            RGBA = half4(R, G, B, A);
            RGB = half3(R, G, B);
            RG = half2(R, G);
        }
        
        void Unity_SceneColor_half(half4 UV, out half3 Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_COLOR(UV.xy);
        }
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Multiply_half3_half3(half3 A, half3 B, out half3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Multiply_half4_half4(half4 A, half4 B, out half4 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half3 BaseColor;
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7be063d957af468180e6d5402ca51556_Out_0_Float = _Distortion;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2 = _SlowWaterSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2 = _SlowWaterTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2, _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2, (_UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4.xy), _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[0];
            half _Split_3275572cd890568f980cafc7c60f69f9_G_2_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[1];
            half _Split_3275572cd890568f980cafc7c60f69f9_B_3_Float = 0;
            half _Split_3275572cd890568f980cafc7c60f69f9_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2 = half2(_Split_3275572cd890568f980cafc7c60f69f9_G_2_Float, _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2;
            Unity_Branch_half2(_Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean, _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2, _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2, _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float = _WaterFlowUVRefresSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float, _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(1), _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float;
            Unity_Fraction_half(_Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float, _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float;
            Unity_Divide_half(half(1), _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float, _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, (_UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4.xy), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float.xx), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2) );
            _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4);
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_R_4_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.r;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_G_5_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.g;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_B_6_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.b;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_A_7_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_30c36922aabc618192374556ee8ce299_Out_0_Float = _SlowNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(0.5), _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float;
            Unity_Fraction_half(_Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float, _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2;
            Unity_Add_half2(_Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2, _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2) );
            _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4);
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_R_4_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.r;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_G_5_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.g;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_B_6_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.b;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_A_7_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float;
            Unity_Add_half(_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float, half(-0.5), _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float;
            Unity_Multiply_half_half(_Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float, 2, _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float;
            Unity_Absolute_half(_Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3, (_Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float.xxx), _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _SmallCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _SmallCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2, _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2, (_UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4.xy), _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[0];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[1];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_B_3_Float = 0;
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2 = half2(_Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float, _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2;
            Unity_Branch_half2(_Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean, _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2, _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2, _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _SmallCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float, _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(1), _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float.xx), _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float;
            Unity_Divide_half(half(1), _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float, _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, (_UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4.xy), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float.xx), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2;
            Unity_Add_half2(_Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _SmallCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(0.5), _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float.xx), _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2, _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4);
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_R_4_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.r;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_G_5_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.g;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_B_6_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.b;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_A_7_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float;
            Unity_Add_half(_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float, half(-0.5), _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float;
            Unity_Multiply_half_half(_Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float, 2, _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float;
            Unity_Absolute_half(_Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3, (_Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float.xxx), _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_e8815c5687c0c188b222e57b486e0e5d_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _SmallCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float;
            Unity_Divide_half(_Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float, half(45), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float;
            Unity_OneMinus_half(_Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float;
            Unity_Subtract_half(_Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float, _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float;
            Unity_Clamp_half(_Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float, half(0), half(2), _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float, _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float;
            Unity_Clamp_half(_Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float, half(0), half(1), _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float;
            Unity_OneMinus_half(_Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float, _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float;
            Unity_Absolute_half(_OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float, _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _SmallCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float;
            Unity_Absolute_half(_Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float, _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float;
            Unity_Clamp_half(_Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float, half(0), half(1), _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6975119070a7eb84950e7da691463776_Out_0_Float = _BigCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float;
            Unity_Divide_half(_Property_6975119070a7eb84950e7da691463776_Out_0_Float, half(45), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float;
            Unity_OneMinus_half(_Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float;
            Unity_Subtract_half(_Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float, _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float;
            Unity_Clamp_half(_Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float, half(0), half(2), _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float, _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float;
            Unity_Clamp_half(_Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float, half(0), half(1), _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float;
            Unity_OneMinus_half(_Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float, _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float;
            Unity_Absolute_half(_OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float, _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float = _BigCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float;
            Unity_Power_half(_Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float, _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float, _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float;
            Unity_Clamp_half(_Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float, half(0), half(1), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float;
            Unity_Subtract_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2 = _BigCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2 = _BigCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2, _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_8773728161068380a52b4e181688e112_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2, (_UV_8773728161068380a52b4e181688e112_Out_0_Vector4.xy), _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[0];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[1];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_B_3_Float = 0;
            half _Split_1be1e5da5681728eb25e1e0354a56de2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2 = half2(_Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float, _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2;
            Unity_Branch_half2(_Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean, _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2, _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2, _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float = _BigCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float, _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(1), _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float;
            Unity_Fraction_half(_Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float, _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float.xx), _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float;
            Unity_Divide_half(half(1), _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float, _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, (_UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4.xy), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float.xx), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2;
            Unity_Add_half2(_Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4);
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_R_4_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.r;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_G_5_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.g;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_B_6_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.b;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_A_7_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float = _BigCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(0.5), _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float;
            Unity_Fraction_half(_Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float, _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float.xx), _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2;
            Unity_Add_half2(_Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2, _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4);
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_R_4_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.r;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_G_5_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.g;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_B_6_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.b;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_A_7_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float;
            Unity_Add_half(_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float, half(-0.5), _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float;
            Unity_Multiply_half_half(_Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float, 2, _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float;
            Unity_Absolute_half(_Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3, (_Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float.xxx), _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3, (_Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float.xxx), _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3, _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[2];
            half _Split_68246b194708098988894c52ed841038_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4;
            half3 _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3;
            half2 _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2;
            Unity_Combine_half(_Split_68246b194708098988894c52ed841038_R_1_Float, _Split_68246b194708098988894c52ed841038_G_2_Float, half(0), half(0), _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4, _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3, _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Property_7be063d957af468180e6d5402ca51556_Out_0_Float.xx), _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2, _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2, _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2, 0.0, 1.0)), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float;
            Unity_Absolute_half(_Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float, _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float = _ShalowFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float;
            Unity_Multiply_half_half(_Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float, -1, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float;
            Unity_Power_half(_Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float, _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _BigCascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float;
            Unity_Lerp_half(_Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float, half(100), _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float, _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float;
            Unity_Saturate_half(_Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float, _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float;
            Unity_Clamp_half(_Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float, half(0), half(1), _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4;
            Unity_Lerp_half4(_Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4, _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4, (_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float.xxxx), _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float, _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float;
            Unity_Clamp_half(_Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float, half(0), half(1), _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float;
            Unity_Power_half(_Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float, _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float, _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float;
            Unity_Clamp_half(_Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float, half(0), half(1), _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float.xxx), _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float = _CleanFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float;
            Unity_Power_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float, _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float;
            Unity_Clamp_half(_Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float, half(0), half(1), _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            #else
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4 = _FoamColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float = _FoamDepth;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float, _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float;
            Unity_Absolute_half(_Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float, _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float = _FoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float;
            Unity_Power_half(_Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float, _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float, _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float;
            Unity_Saturate_half(_Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float, _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2 = _FoamSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2 = _FoamTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2, _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2, (_UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4.xy), _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_ae6014510e633681b63895fb895fb552_R_1_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[0];
            half _Split_ae6014510e633681b63895fb895fb552_G_2_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[1];
            half _Split_ae6014510e633681b63895fb895fb552_B_3_Float = 0;
            half _Split_ae6014510e633681b63895fb895fb552_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2 = half2(_Split_ae6014510e633681b63895fb895fb552_G_2_Float, _Split_ae6014510e633681b63895fb895fb552_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2;
            Unity_Branch_half2(_Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean, _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2, _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2, _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float;
            Unity_Divide_half(half(1), _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float, _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, (_UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4.xy), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float.xx), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_094898c3a8179686900646a49173411c_Out_2_Vector2;
            Unity_Add_half2(_Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Add_094898c3a8179686900646a49173411c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_094898c3a8179686900646a49173411c_Out_2_Vector2) );
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_R_4_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.r;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_G_5_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.g;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.b;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_A_7_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2;
            Unity_Add_half2(_Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2, _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2) );
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_R_4_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.r;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_G_5_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.g;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.b;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_A_7_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float, _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float;
            Unity_Multiply_half_half(_Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float, _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float;
            Unity_Lerp_half(_Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float, half(0), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float;
            Unity_Clamp_half(_Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float, half(0), half(1), _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3, (_Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4.xyz), (_Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float.xxx), _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2 = _NoiseTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2, (_UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4.xy), _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_531c539071350e8587150bda75bbea54_R_1_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[0];
            half _Split_531c539071350e8587150bda75bbea54_G_2_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[1];
            half _Split_531c539071350e8587150bda75bbea54_B_3_Float = 0;
            half _Split_531c539071350e8587150bda75bbea54_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2 = half2(_Split_531c539071350e8587150bda75bbea54_G_2_Float, _Split_531c539071350e8587150bda75bbea54_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2;
            Unity_Branch_half2(_Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean, _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2, _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2, _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_2a70658053db97858286624babe5442d_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_2a70658053db97858286624babe5442d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_2a70658053db97858286624babe5442d_Out_1_Float.xx), _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6907e5604f833889014e993d4afa562_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e6907e5604f833889014e993d4afa562_Out_0_Float, _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, (_UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4.xy), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float.xx), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2;
            Unity_Add_half2(_Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2) );
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_R_4_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_G_5_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_B_6_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float.xx), _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2;
            Unity_Add_half2(_Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2, _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2) );
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_R_4_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.r;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_G_5_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.g;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_B_6_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.b;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float, _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float;
            Unity_Absolute_half(_Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float, _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _SmallCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _SmallCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float;
            Unity_Multiply_half_half(_Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float, _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float, _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float;
            Unity_Clamp_half(_Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float, half(0), half(1), _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4 = _SmallCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxxx), _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float;
            Unity_Absolute_half(_Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float = _SmallCascadeFoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float;
            Unity_Power_half(_Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float, _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float, _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float;
            Unity_Clamp_half(_Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float, half(0), half(1), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_R_4_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.r;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.g;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_B_6_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.b;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_A_7_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_R_4_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.r;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.g;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_B_6_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.b;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_A_7_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float, _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float;
            Unity_Multiply_half_half(0.5, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float = _BigCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float, _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float = _BigCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float;
            Unity_Multiply_half_half(_Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float, _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float, _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float;
            Unity_Clamp_half(_Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float, half(0), half(1), _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float;
            Unity_Lerp_half(_Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float, _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4 = _BigCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float.xxxx), _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4, _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float;
            Unity_Absolute_half(_Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float = Big_Cascade_Foam_Falloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float;
            Unity_Power_half(_Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float, _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float, _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float;
            Unity_Clamp_half(_Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float, half(0), half(1), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3, (_Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4.xyz), (_Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float.xxx), _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.BaseColor = _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv3 = input.texCoord3;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        #endif
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "Universal 2D"
            Tags
            {
                "LightMode" = "Universal2D"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _DISTORTION_ON
        
        #if defined(_DISTORTION_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD3
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_CULLFACE
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_2D
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_DEPTH_TEXTURE
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define REQUIRE_OPAQUE_TEXTURE
        #endif
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3 : TEXCOORD3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 ScreenPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 NDCPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 PixelPosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TimeParameters;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float FaceSign;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord3 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP4;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord3 = input.texCoord3.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        half _GlobalTiling;
        half _UVVDirection1UDirection0;
        half2 _SlowWaterSpeed;
        half2 _SmallCascadeMainSpeed;
        half2 _BigCascadeMainSpeed;
        half _EdgeFalloffMultiply;
        half _EdgeFalloffPower;
        half _CleanFalloffMultiply;
        half _CleanFalloffPower;
        half4 _ShalowColor;
        half _ShalowFalloffMultiply;
        half _ShalowFalloffPower;
        half4 _DeepColor;
        half _WaterAlphaMultiply;
        half _WaterAlphaPower;
        half _OutlinePower;
        half _OutlineFalloffBorder;
        half4 _Outline_Color;
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _FarNormalPower;
        half _SmallCascadeAngle;
        half _SmallCascadeAngleFalloff;
        half2 _SmallCascadeTiling;
        half _SmallCascadeNormalScale;
        half4 _SmallCascadeColor;
        half _SmallCascadeFoamFalloff;
        half _SmallCascadeSmoothness;
        half _SmallCascadeSpecular;
        half _BigCascadeAngle;
        half _BigCascadeAngleFalloff;
        half _BigCascadeNormalScale;
        half2 _BigCascadeTiling;
        half _BigCascadeSmoothness;
        half _BigCascadeSpecular;
        half4 _BigCascadeColor;
        half Big_Cascade_Foam_Falloff;
        half _BigCascadeTransparency;
        half _SmallCascadeNoisePower;
        half _BigCascadeNoisePower;
        half _SmallCascadeNoiseMultiply;
        half _BigCascadeNoiseMultiply;
        half4 _FoamColor;
        half2 _FoamTiling;
        half2 _FoamSpeed;
        half _FoamDepth;
        half _FoamFalloff;
        half _FoamSmoothness;
        half _FoamSpecular;
        half2 _NoiseTiling;
        half2 _NoiseSpeed;
        half _AOPower;
        half _WaterFlowUVRefresSpeed;
        half _SmallCascadeFlowUVRefreshSpeed;
        half _BigCascadeFlowUVRefreshSpeed;
        float4 _CascadesTexturesRGFoamBNoiseA_TexelSize;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_CascadesTexturesRGFoamBNoiseA);
        SAMPLER(sampler_CascadesTexturesRGFoamBNoiseA);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Multiply_half2_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Branch_half2(half Predicate, half2 True, half2 False, out half2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_half_half(half A, half B, out half Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_half(half A, half B, out half Out)
        {
            Out = A + B;
        }
        
        void Unity_Fraction_half(half In, out half Out)
        {
            Out = frac(In);
        }
        
        void Unity_Divide_half(half A, half B, out half Out)
        {
            Out = A / B;
        }
        
        void Unity_Add_half2(half2 A, half2 B, out half2 Out)
        {
            Out = A + B;
        }
        
        void Unity_NormalStrength_half(half3 In, half Strength, out half3 Out)
        {
            Out = half3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Absolute_half(half In, out half Out)
        {
            Out = abs(In);
        }
        
        void Unity_Lerp_half3(half3 A, half3 B, half3 T, out half3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Clamp_half(half In, half Min, half Max, out half Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_OneMinus_half(half In, out half Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Subtract_half(half A, half B, out half Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Normalize_half3(half3 In, out half3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Combine_half(half R, half G, half B, half A, out half4 RGBA, out half3 RGB, out half2 RG)
        {
            RGBA = half4(R, G, B, A);
            RGB = half3(R, G, B);
            RG = half2(R, G);
        }
        
        void Unity_SceneColor_half(half4 UV, out half3 Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_COLOR(UV.xy);
        }
        
        void Unity_Comparison_Greater_half(half A, half B, out half Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_SceneDepth_Raw_half(half4 UV, out half Out)
        {
            Out = SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy);
        }
        
        void Unity_Branch_half(half Predicate, half True, half False, out half Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        // unity-custom-func-begin
        void GetClipValues_half(out half2 Out){
        Out = float2(
        
        UNITY_NEAR_CLIP_VALUE,
        
        UNITY_RAW_FAR_CLIP_VALUE
        
        );
        }
        // unity-custom-func-end
        
        void Unity_Remap_half(half In, half2 InMinMax, half2 OutMinMax, out half Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Saturate_half(half In, out half Out)
        {
            Out = saturate(In);
        }
        
        void Unity_SceneDepth_Linear01_half(half4 UV, out half Out)
        {
            Out = Linear01Depth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
        }
        
        struct Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half
        {
        float4 ScreenPosition;
        float2 NDCPosition;
        };
        
        void SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half IN, out half Out_Depth_1)
        {
        half _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean;
        Unity_Comparison_Greater_half(unity_OrthoParams.w, half(0), _Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean);
        half _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean;
        Unity_Comparison_Greater_half(_ProjectionParams.x, half(0), _Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean);
        half _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float;
        Unity_SceneDepth_Raw_half(half4(IN.NDCPosition.xy, 0, 0), _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float);
        half _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float;
        Unity_OneMinus_half(_SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float);
        half _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float;
        Unity_Branch_half(_Comparison_d96395b3e72040e188ca478af6a1c33c_Out_2_Boolean, _SceneDepth_6fe53cd00c8e44ec9419827b739c5999_Out_1_Float, _OneMinus_af72815d977e4523b2215afd286e7a06_Out_1_Float, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float);
        half _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Branch_bf486b3b6118472fbf8e4f051cb27ee8_Out_3_Float, _Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float);
        half4 _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4 = IN.ScreenPosition;
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_62277fd721f74a399bd1009f8b3cb8e3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half2 _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2;
        GetClipValues_half(_GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2);
        half _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float;
        Unity_Remap_half(_Split_62277fd721f74a399bd1009f8b3cb8e3_B_3_Float, _GetClipValuesCustomFunction_81a683b70b2c40e697034db9303cd697_Out_0_Vector2, half2 (0, 1), _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float);
        half _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float;
        Unity_Lerp_half(_ProjectionParams.y, _ProjectionParams.z, _Remap_1907dbd4ae754843a5d74245135e2923_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float);
        half _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float;
        Unity_Subtract_half(_Lerp_69aceedd19ff4eab82ca8871df668e7d_Out_3_Float, _Lerp_c0ff8fdca15244b8928cae7c04ed3c8a_Out_3_Float, _Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float);
        half _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float;
        Unity_Saturate_half(_Subtract_b98f5f0e27014160829b37533239eca2_Out_2_Float, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float);
        half4 _ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
        half _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float;
        Unity_SceneDepth_Linear01_half(_ScreenPosition_1840c6e32f18452fbfff4dfc4298c360_Out_0_Vector4, _SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float);
        half _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float;
        Unity_Multiply_half_half(_SceneDepth_fbdb86649cb648d5a0b14fe96d1a4aaa_Out_1_Float, _ProjectionParams.z, _Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float);
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_R_1_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[0];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_G_2_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[1];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_B_3_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[2];
        half _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float = _ScreenPosition_bee0465ff8f44c37a1d3c33e60259869_Out_0_Vector4[3];
        half _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float;
        Unity_Subtract_half(_Multiply_a09f3cb241a0445e9172911ea60b1176_Out_2_Float, _Split_3ca0bff404aa485a9fc20ea40bd8fbf3_A_4_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float);
        half _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        Unity_Branch_half(_Comparison_985e0c3c97f94010884b675fbb75d53f_Out_2_Boolean, _Saturate_b1b2516521e947caae8cd2a91d4d96ca_Out_1_Float, _Subtract_270f2b4ef4ec46dda4dc793ad9b9d91f_Out_2_Float, _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float);
        Out_Depth_1 = _Branch_ebe5a68892494ba1936d0ea3513c3689_Out_3_Float;
        }
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Multiply_half3_half3(half3 A, half3 B, out half3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Multiply_half4_half4(half4 A, half4 B, out half4 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            half3 Position;
            half3 Normal;
            half3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            half3 BaseColor;
            half Alpha;
            half AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7be063d957af468180e6d5402ca51556_Out_0_Float = _Distortion;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2 = _SlowWaterSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2 = _SlowWaterTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_877d7e28976d8f85bbc8ab7a485949eb_Out_0_Vector2, _Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, _Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_5c583e2d69d84f8fbe8b4780b3d8a63e_Out_2_Vector2, (_UV_f4621e74c19ebd878a3c17e67ce708ea_Out_0_Vector4.xy), _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[0];
            half _Split_3275572cd890568f980cafc7c60f69f9_G_2_Float = _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2[1];
            half _Split_3275572cd890568f980cafc7c60f69f9_B_3_Float = 0;
            half _Split_3275572cd890568f980cafc7c60f69f9_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2 = half2(_Split_3275572cd890568f980cafc7c60f69f9_G_2_Float, _Split_3275572cd890568f980cafc7c60f69f9_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2;
            Unity_Branch_half2(_Property_9888f536495c078d8d13e4f93f260994_Out_0_Boolean, _Multiply_6f7dc3b0a672db849d21ad93536b3fdb_Out_2_Vector2, _Vector2_5031750d94e60b848422357418f3bcaf_Out_0_Vector2, _Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float = _WaterFlowUVRefresSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_41fea7dea3f9c78fbf154c14e561037a_Out_0_Float, _Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(1), _Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float;
            Unity_Fraction_half(_Add_92b72288f9b4b38db82936b75e8bb404_Out_2_Float, _Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float;
            Unity_Divide_half(half(1), _Property_c92d9ef7ab07168d94ca1468d5742541_Out_0_Float, _Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_398a18f78c81d28393067eae86b7f0c3_Out_0_Vector2, (_UV_a0446ab16407b5868a7f70150b9cf00f_Out_0_Vector4.xy), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_1994eb9d3d14d4858efc4027a20aa109_Out_2_Float.xx), _Multiply_ed84567dd41c4184ad608bb3b41b9759_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_c9f099059e20738880a26ac7ced1e57b_Out_2_Vector2, _Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_d445560ce659218caecd0d785efe05e8_Out_2_Vector2) );
            _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4);
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_R_4_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.r;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_G_5_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.g;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_B_6_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.b;
            half _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_A_7_Float = _SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_30c36922aabc618192374556ee8ce299_Out_0_Float = _SlowNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_2a19232462fd2d83a3dcaeb21503d1fd_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float;
            Unity_Add_half(_Multiply_470ba181bab9cb8fa9ff9e14fa2cc574_Out_2_Float, half(0.5), _Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float;
            Unity_Fraction_half(_Add_70b1025eb8a6f28ea40920257d95c21a_Out_2_Float, _Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_80768e9b64c73389b3b24ff32967183d_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2;
            Unity_Add_half2(_Multiply_e0cf556371b9008ab263486f791dff07_Out_2_Vector2, _Multiply_278ee8efb0bfeb80afe3f504cfc90631_Out_2_Vector2, _Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_973bdb6610abba8aaa3cef63a78baa06_Out_0_Texture2D.GetTransformedUV(_Add_e10ca8ac66cfc08297c1281f988ee064_Out_2_Vector2) );
            _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4);
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_R_4_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.r;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_G_5_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.g;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_B_6_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.b;
            half _SampleTexture2D_1ffc3e624270ee899e223323127b2536_A_7_Float = _SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_1ffc3e624270ee899e223323127b2536_RGBA_0_Vector4.xyz), _Property_30c36922aabc618192374556ee8ce299_Out_0_Float, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float;
            Unity_Add_half(_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float, half(-0.5), _Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float;
            Unity_Multiply_half_half(_Add_3ddb19ebf14eb0878d65e72de48dc419_Out_2_Float, 2, _Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float;
            Unity_Absolute_half(_Multiply_d7bcc2eee2e3f4859b303a06641db1c5_Out_2_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_768a023761a00b8bac27ec164d4feca3_Out_2_Vector3, _NormalStrength_4e7cd17dd72ec485804b19279c62419c_Out_2_Vector3, (_Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float.xxx), _Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _SmallCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _SmallCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2, _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, _Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_fe4a93ea96d39d868ea4f0d5efeb112c_Out_2_Vector2, (_UV_155f0df72125e686952a429f2ffd5986_Out_0_Vector4.xy), _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[0];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float = _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2[1];
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_B_3_Float = 0;
            half _Split_05bdaffcb94c1a8b8907cb9ae0088e28_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2 = half2(_Split_05bdaffcb94c1a8b8907cb9ae0088e28_G_2_Float, _Split_05bdaffcb94c1a8b8907cb9ae0088e28_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2;
            Unity_Branch_half2(_Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean, _Multiply_495eeee31c9fc988ae6d3bfad7de23fb_Out_2_Vector2, _Vector2_84709b62ed0ec186bd8b6072a206cdbb_Out_0_Vector2, _Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _SmallCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float, _Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(1), _Add_876c6899ecc5ff8d90391762631227de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float.xx), _Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float;
            Unity_Divide_half(half(1), _Property_4122249ff176f58da9d0dbace2f883d0_Out_0_Float, _Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2, (_UV_2506007e9678e78d9a828d0c6d6d7a6d_Out_0_Vector4.xy), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_8ff972a4c7eb9b839c81321397365f61_Out_2_Float.xx), _Multiply_70e030c7414b0a80aeeebb50f2b469c7_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2;
            Unity_Add_half2(_Multiply_d677aa2bd65e8c8380cc99b91cd2c450_Out_2_Vector2, _Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _SmallCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float;
            Unity_Add_half(_Multiply_23d149ee58240383a51fc47bd5080b38_Out_2_Float, half(0.5), _Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_7f6b134feaed2883a01e3679b96dd6bd_Out_3_Vector2, (_Fraction_53e447b055d9058b81ec06c6e9fd2751_Out_1_Float.xx), _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5a2803205dbaf0849d4f2b64006614c0_Out_2_Vector2, _Multiply_04dd3871b39faf80b01741bc1936975c_Out_2_Vector2, _Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_f8c127b1bdf0e084a3eee6e8ac25c153_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4);
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_R_4_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.r;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_G_5_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.g;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_B_6_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.b;
            half _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_A_7_Float = _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4.xyz), _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float;
            Unity_Add_half(_Fraction_41693b4717b08a83ac836421a5f95130_Out_1_Float, half(-0.5), _Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float;
            Unity_Multiply_half_half(_Add_078e4ea9683ad287b56d5fba77b52f19_Out_2_Float, 2, _Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float;
            Unity_Absolute_half(_Multiply_5c1317f91a58a385b34f1663a9bf1484_Out_2_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_353595f40a3cf58cb0c8a5f951505d9a_Out_2_Vector3, _NormalStrength_59ae87d6cd8faa8f9fea0640fb1a6c7c_Out_2_Vector3, (_Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float.xxx), _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_e8815c5687c0c188b222e57b486e0e5d_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_e8815c5687c0c188b222e57b486e0e5d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_fc0461ec8ebeca879bcadffa4f525561_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _SmallCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float;
            Unity_Divide_half(_Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float, half(45), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float;
            Unity_OneMinus_half(_Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float;
            Unity_Subtract_half(_Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float, _OneMinus_51d362fe4abf8088a515cede6efdeae6_Out_1_Float, _Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float;
            Unity_Clamp_half(_Subtract_df7e03fdbee60f829e8414ab56aebd63_Out_2_Float, half(0), half(2), _Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_9e59ae67ac09cc85ac256679eb8a92df_Out_2_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_93c899dfdaf23a869025d2fe37cbc17b_Out_3_Float, _Divide_99e399b80aa3d78c9b8289ae31f1e13c_Out_2_Float, _Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float;
            Unity_Clamp_half(_Multiply_7079e8acdf5057888843275dbbdb199c_Out_2_Float, half(0), half(1), _Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float;
            Unity_OneMinus_half(_Clamp_6b3d8b850a8e5188b8a540162210198d_Out_3_Float, _OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float;
            Unity_Absolute_half(_OneMinus_464327f0009fbb8fa990d2cb702b2da9_Out_1_Float, _Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _SmallCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_R_1_Float = IN.WorldSpaceNormal[0];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float = IN.WorldSpaceNormal[1];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_B_3_Float = IN.WorldSpaceNormal[2];
            half _Split_b9e7b4a6b4b5e58aa502d4b6d169b792_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float;
            Unity_Absolute_half(_Split_b9e7b4a6b4b5e58aa502d4b6d169b792_G_2_Float, _Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float;
            Unity_Clamp_half(_Absolute_1c70268b89d51d8aad9f53074af7caa4_Out_1_Float, half(0), half(1), _Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6975119070a7eb84950e7da691463776_Out_0_Float = _BigCascadeAngle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float;
            Unity_Divide_half(_Property_6975119070a7eb84950e7da691463776_Out_0_Float, half(45), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float;
            Unity_OneMinus_half(_Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float;
            Unity_Subtract_half(_Clamp_c2714660b22e6a86a3d1f402132434f1_Out_3_Float, _OneMinus_a7c4799546af71898266d38a4354b568_Out_1_Float, _Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float;
            Unity_Clamp_half(_Subtract_e487cff09d7e158e8f03eeef153fbe43_Out_2_Float, half(0), half(2), _Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float;
            Unity_Divide_half(half(1), _Divide_86811ef0d01a1581b082fc982daa687c_Out_2_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_001f24015dba2889ab4be2cbfefbc81f_Out_3_Float, _Divide_d1e47cd61e61c487be74fb1989b0bbb8_Out_2_Float, _Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float;
            Unity_Clamp_half(_Multiply_a6dece8284b0dd89b3ad78540f989a2b_Out_2_Float, half(0), half(1), _Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float;
            Unity_OneMinus_half(_Clamp_69414a1448338e8d9fc890185b317bc6_Out_3_Float, _OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float;
            Unity_Absolute_half(_OneMinus_b3ab3b092be02a8dbebaa86bf00ea51d_Out_1_Float, _Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float = _BigCascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float;
            Unity_Power_half(_Absolute_6cd65b456694da879b288dd44c7c10c6_Out_1_Float, _Property_f5a63fda0810468082350dfa23ec6bf3_Out_0_Float, _Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float;
            Unity_Clamp_half(_Power_0c67a131ce19048caeed8c043e033fb9_Out_2_Float, half(0), half(1), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float;
            Unity_Subtract_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Subtract_f5a0254d84d483809c75d54a89dbc25e_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2 = _BigCascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2 = _BigCascadeTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1d9925ecc19284849bb9705ef6f8c824_Out_0_Vector2, _Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, _Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_8773728161068380a52b4e181688e112_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_374e1fbcd041348c9e1605af3643e846_Out_2_Vector2, (_UV_8773728161068380a52b4e181688e112_Out_0_Vector4.xy), _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[0];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float = _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2[1];
            half _Split_1be1e5da5681728eb25e1e0354a56de2_B_3_Float = 0;
            half _Split_1be1e5da5681728eb25e1e0354a56de2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2 = half2(_Split_1be1e5da5681728eb25e1e0354a56de2_G_2_Float, _Split_1be1e5da5681728eb25e1e0354a56de2_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2;
            Unity_Branch_half2(_Property_b7109f4bbd38b98d9cbae4fba5543a46_Out_0_Boolean, _Multiply_fc100cbda65dac85b9b9027ad12941ed_Out_2_Vector2, _Vector2_3d86aae3a5d3f48ba40ca1f53e71acb7_Out_0_Vector2, _Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float = _BigCascadeFlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_a29d4264dadc878687c59348530e0cb7_Out_0_Float, _Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(1), _Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float;
            Unity_Fraction_half(_Add_e75161453035ef83a5b9148c4fa24c85_Out_2_Float, _Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float.xx), _Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float;
            Unity_Divide_half(half(1), _Property_7e9d4fdee6095e8cb4916776509ca03c_Out_0_Float, _Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_1c3d54765bc6a585ac8690ff98875af6_Out_0_Vector2, (_UV_88bd34a9ea85a58eaa101897a97eeb96_Out_0_Vector4.xy), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_02af391a0750818ebddd34c84d2ba47c_Out_2_Float.xx), _Multiply_50905267b40ca083b044feec615f813b_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2;
            Unity_Add_half2(_Multiply_019f6e249bc19989a973145ebde380e1_Out_2_Vector2, _Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4);
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_R_4_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.r;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_G_5_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.g;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_B_6_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.b;
            half _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_A_7_Float = _SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float = _BigCascadeNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_571502bc4c48ad8e8d75d0743c4fd5d6_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float;
            Unity_Add_half(_Multiply_16610d661d5a6d80af8fd2981d1e9bff_Out_2_Float, half(0.5), _Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float;
            Unity_Fraction_half(_Add_2de62508721fd88e99b5c9b5be747fde_Out_2_Float, _Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_02ce2610bffd338dbded26b6ea66c568_Out_3_Vector2, (_Fraction_0c3370c032db598eba83b2e087064b6d_Out_1_Float.xx), _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2;
            Unity_Add_half2(_Multiply_9f387ef657d4498e9c8e57dd3a8dd117_Out_2_Vector2, _Multiply_c1fdaed91a9f6b83b8d2aae1d0a34551_Out_2_Vector2, _Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_12aa1a8406e44a819df8f8ae55f56d6c_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4);
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_R_4_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.r;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_G_5_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.g;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_B_6_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.b;
            half _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_A_7_Float = _SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_785ee097397c3688ad51d76c6fc5ba77_RGBA_0_Vector4.xyz), _Property_48f492f6311fa887a8666bf46f288d9d_Out_0_Float, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float;
            Unity_Add_half(_Fraction_a9e03f4c9a57c38e8d33cfa1842b86e2_Out_1_Float, half(-0.5), _Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float;
            Unity_Multiply_half_half(_Add_65f2d60b944d3e80ac12d4517bbd021b_Out_2_Float, 2, _Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float;
            Unity_Absolute_half(_Multiply_3e21e0051eeddd8db9798e5cce43fb03_Out_2_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_9ebe899be918d38cac53ee34e22a3dc2_Out_2_Vector3, _NormalStrength_52f08b3e9ed3698faef8a8a64e53b5cf_Out_2_Vector3, (_Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float.xxx), _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Lerp_18ff3f20527a1f80bfa8428835890e50_Out_3_Vector3, (_Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float.xxx), _Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_d9e9462272e2158e9b5f5d5572146a25_Out_3_Vector3, _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_f7fc2717624c388ebf2451ef6a32ed01_Out_1_Vector3[2];
            half _Split_68246b194708098988894c52ed841038_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4;
            half3 _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3;
            half2 _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2;
            Unity_Combine_half(_Split_68246b194708098988894c52ed841038_R_1_Float, _Split_68246b194708098988894c52ed841038_G_2_Float, half(0), half(0), _Combine_3e7eba45ae0aa38280cf04a546560420_RGBA_4_Vector4, _Combine_3e7eba45ae0aa38280cf04a546560420_RGB_5_Vector3, _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Property_7be063d957af468180e6d5402ca51556_Out_0_Float.xx), _Combine_3e7eba45ae0aa38280cf04a546560420_RG_6_Vector2, _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_0ca6abd42943178681f59d07d7f72423_Out_0_Vector4.xy), _Multiply_30d0d3b148de9485a3ebfa7f86e3a3ce_Out_2_Vector2, _Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_2d4cbf3721fbfd88be33d40794bba9ff_Out_2_Vector2, 0.0, 1.0)), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_aa98b58318e4467db394e679e29b1548;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_aa98b58318e4467db394e679e29b1548.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548, _DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float;
            Unity_Absolute_half(_Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float, _Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float = _ShalowFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float;
            Unity_Multiply_half_half(_Property_e6dd087698d3e984bd5eb642347af797_Out_0_Float, -1, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float;
            Unity_Power_half(_Absolute_c9feaf529682ca80b82407b0d7b43670_Out_1_Float, _Multiply_becf2d84b3023389befca89c1a80edcf_Out_2_Float, _Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _BigCascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float;
            Unity_Lerp_half(_Power_aaf82c5db3291a8bb2095cce38670a92_Out_2_Float, half(100), _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float, _Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float;
            Unity_Saturate_half(_Lerp_801d3d778aeeb287b05727f83b764636_Out_3_Float, _Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float;
            Unity_Clamp_half(_Saturate_ad5b4b8242b08088a70a691ffa09f856_Out_1_Float, half(0), half(1), _Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4;
            Unity_Lerp_half4(_Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4, _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4, (_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float.xxxx), _Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_1a4064d4c5e44d8d8bf339fbd8490bf0_Out_0_Float, _Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float;
            Unity_Clamp_half(_Multiply_61f2e3fcf6e1ae8e8a178ab42616f46e_Out_2_Float, half(0), half(1), _Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float;
            Unity_Power_half(_Clamp_f5a8524b7a5db586924b121738ac94e8_Out_3_Float, _Property_46d6bb17b4d30b89bf67682461399d71_Out_0_Float, _Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float;
            Unity_Clamp_half(_Power_27118d86ba1fda85939d9a0caae7b3aa_Out_2_Float, half(0), half(1), _Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_13bfc3ad146599869e362f6298776454_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_8d54590d42b1248ba2a54d415f510801_Out_3_Float.xxx), _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float;
            Unity_Clamp_half(_Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float, half(0), half(1), _Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float;
            Unity_Absolute_half(_Clamp_b1b90ad6d1d94a8d928998aae0fc2a0f_Out_3_Float, _Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float = _CleanFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float;
            Unity_Power_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_150ab2ec8c4a8983b5372fb8ee1209a7_Out_0_Float, _Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float;
            Unity_Clamp_half(_Power_f4a310d75a76d28bb72f53cb07b7cf22_Out_2_Float, half(0), half(1), _Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_25cd1466067a428c9d144daeee8616ea_Out_1_Vector3, _Lerp_dbfea6d25d3ee0879590bf2292f4bdc1_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = _Lerp_cf9aa347ec388989a0d77bfb19ffc6fd_Out_3_Vector3;
            #else
            half3 _UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4 = _FoamColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float = _FoamDepth;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float;
            Unity_Add_half(_DepthTestSimple_aa98b58318e4467db394e679e29b1548_OutDepth_1_Float, _Property_f7361841153ca0879e129c1f50d23af9_Out_0_Float, _Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float;
            Unity_Absolute_half(_Add_f5ed355a1f600f8f9c1ea605d3034de1_Out_2_Float, _Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float = _FoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float;
            Unity_Power_half(_Absolute_2632bd759f52aa878f2f9b2f3719e92d_Out_1_Float, _Property_9003e5fb0ded708186f5d92a2b568429_Out_0_Float, _Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float;
            Unity_Saturate_half(_Power_d51325e1acb3798eb96825fed6e4c6be_Out_2_Float, _Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2 = _FoamSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2 = _FoamTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8220784d89c3438bbda9aff61ac09ddd_Out_0_Vector2, _Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, _Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cf6975c676114281b8409162ca1a1c62_Out_2_Vector2, (_UV_e657ea16b9a5fa81b7b424c9da481604_Out_0_Vector4.xy), _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_ae6014510e633681b63895fb895fb552_R_1_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[0];
            half _Split_ae6014510e633681b63895fb895fb552_G_2_Float = _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2[1];
            half _Split_ae6014510e633681b63895fb895fb552_B_3_Float = 0;
            half _Split_ae6014510e633681b63895fb895fb552_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2 = half2(_Split_ae6014510e633681b63895fb895fb552_G_2_Float, _Split_ae6014510e633681b63895fb895fb552_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2;
            Unity_Branch_half2(_Property_dfd784d6288ecc848c49542bab0042ff_Out_0_Boolean, _Multiply_9bd0abbf752ba082a47aa1843fbfb771_Out_2_Vector2, _Vector2_36bd4a464bd72d8191e898daa0e7dacf_Out_0_Vector2, _Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_9838acefa02d1a818122b87a27ec8206_Out_1_Float.xx), _Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float;
            Unity_Divide_half(half(1), _Property_3d31f8daa36aba8db83ad5a5674e81eb_Out_0_Float, _Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_796253fba296d78ea699f91cfe75f3ae_Out_0_Vector2, (_UV_9dcbc33f2a04538d96cffd83692f9d1d_Out_0_Vector4.xy), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b4458673b8b8d98981baaa274a0d9a99_Out_2_Float.xx), _Multiply_e19563f2c63e0180a5867ab32378e234_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_094898c3a8179686900646a49173411c_Out_2_Vector2;
            Unity_Add_half2(_Multiply_ad10733a8fa5e082aa155c690ec756af_Out_2_Vector2, _Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Add_094898c3a8179686900646a49173411c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_094898c3a8179686900646a49173411c_Out_2_Vector2) );
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_R_4_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.r;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_G_5_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.g;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.b;
            half _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_A_7_Float = _SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_ff31d89ac28795898c010d4876142010_Out_3_Vector2, (_Fraction_d2d2249ee260908ebc6a039a24038686_Out_1_Float.xx), _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2;
            Unity_Add_half2(_Multiply_6a659aace162af8e96ce7c88bd11a890_Out_2_Vector2, _Multiply_17f3ac7fc8d74b819eb3bbe2a2d2177c_Out_2_Vector2, _Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.tex, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.samplerstate, _Property_7fca4529ade27f83acb6a759fb72984b_Out_0_Texture2D.GetTransformedUV(_Add_7675da1b4065148d9302815efe797ac0_Out_2_Vector2) );
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_R_4_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.r;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_G_5_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.g;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.b;
            half _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_A_7_Float = _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_49e31a0f4543e6898e54b2d73bbeaac3_B_6_Float, _SampleTexture2D_cc7f2301a7c70788a748273c3dd9485c_B_6_Float, _Absolute_dcde6658c2a5098cb211075361125443_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float;
            Unity_Multiply_half_half(_Saturate_57d130a5e735708fbfbf4270d7b7d0fe_Out_1_Float, _Lerp_964c258c0969178ba24afa624b965884_Out_3_Float, _Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float;
            Unity_Lerp_half(_Multiply_4dfe464ddc0ba580a272fc742146df33_Out_2_Float, half(0), _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float;
            Unity_Clamp_half(_Lerp_56eda20393c4ff89bed4bcfc1841a6f2_Out_3_Float, half(0), half(1), _Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_c22c4bdc8f34ce8d9cb6de9910648f3e_Out_0_Vector3, (_Property_a55e33720a1bef818f904df45d211e91_Out_0_Vector4.xyz), (_Clamp_e6b29de69174a7848bf1c7a16206cc99_Out_3_Float.xxx), _Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.tex, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.samplerstate, _Property_835b1d3ec267898cb5410fd279147a93_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2 = _NoiseTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, _Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_cddaf9e49beaef8da0018dcc806cd8f4_Out_2_Vector2, (_UV_06326fe6f02f3282a9f859587f69c746_Out_0_Vector4.xy), _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_531c539071350e8587150bda75bbea54_R_1_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[0];
            half _Split_531c539071350e8587150bda75bbea54_G_2_Float = _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2[1];
            half _Split_531c539071350e8587150bda75bbea54_B_3_Float = 0;
            half _Split_531c539071350e8587150bda75bbea54_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2 = half2(_Split_531c539071350e8587150bda75bbea54_G_2_Float, _Split_531c539071350e8587150bda75bbea54_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2;
            Unity_Branch_half2(_Property_42eb5c0700b5908c9f913c8cb73f97ea_Out_0_Boolean, _Multiply_92683a96dc8d0f86be81c110d3c40453_Out_2_Vector2, _Vector2_7535e10c38d9b48798fac6ad29cc6618_Out_0_Vector2, _Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_2a70658053db97858286624babe5442d_Out_1_Float;
            Unity_Fraction_half(_Add_876c6899ecc5ff8d90391762631227de_Out_2_Float, _Fraction_2a70658053db97858286624babe5442d_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_2a70658053db97858286624babe5442d_Out_1_Float.xx), _Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e6907e5604f833889014e993d4afa562_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e6907e5604f833889014e993d4afa562_Out_0_Float, _Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_4ae06833e4525e8fb8cc5f80173448d8_Out_0_Vector2, (_UV_c5aa58f9c7576180958ddac8743ad40e_Out_0_Vector4.xy), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_9a5bf5795f20a88084d6d3cdea749e85_Out_2_Float.xx), _Multiply_e530bf69123d478b9aa06c824cbf3e54_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2;
            Unity_Add_half2(_Multiply_29c6a0ef94860e8e95b5d0a039fdcca3_Out_2_Vector2, _Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_d3cbecd6805bec83b76f7bee2c302717_Out_2_Vector2) );
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_R_4_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_G_5_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_B_6_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float = _SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float;
            Unity_Fraction_half(_Add_cb630e934cbc9685bfa7152c7efc895b_Out_2_Float, _Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_3db836635bfafb87acff5115c0f39410_Out_3_Vector2, (_Fraction_bc2488428f5b0089b3c738d5b05e8aec_Out_1_Float.xx), _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2;
            Unity_Add_half2(_Multiply_1a1ba3287445f98c8bdf53698e284ada_Out_2_Vector2, _Multiply_8d5138ce62113284bb29afa3f0ee6ce6_Out_2_Vector2, _Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.tex, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.samplerstate, _Property_85e00794c5b7fb8eb7c972e88a3ab339_Out_0_Texture2D.GetTransformedUV(_Add_f69792814abf9586ba0aa098c252dc67_Out_2_Vector2) );
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_R_4_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.r;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_G_5_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.g;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_B_6_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.b;
            half _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float = _SampleTexture2D_ab253ce07034f18babc498d699e89d65_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad373458a29e628890fa8201f0c0af9a_A_7_Float, _SampleTexture2D_ab253ce07034f18babc498d699e89d65_A_7_Float, _Absolute_8e8928ed0e4ab886a977ad493e353a5e_Out_1_Float, _Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float;
            Unity_Absolute_half(_Lerp_c73e10df9d3c9e82a45b162ad9dbaad3_Out_3_Float, _Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _SmallCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _SmallCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float;
            Unity_Multiply_half_half(_Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float, _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float, _Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float;
            Unity_Clamp_half(_Multiply_fcadbe8da631b6808af696c6f4d38fa2_Out_2_Float, half(0), half(1), _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4 = _SmallCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxxx), _Property_65f9236a3c7961889e323e288e50ed08_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float;
            Unity_Absolute_half(_Lerp_f06ceaa3641a2680a312e8c5c26891bd_Out_3_Float, _Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float = _SmallCascadeFoamFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float;
            Unity_Power_half(_Absolute_a74bb12daff95a86a83cc2ea34a1bb83_Out_1_Float, _Property_a1f8a122c18e2582b5d4c5da5aaa8a36_Out_0_Float, _Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float;
            Unity_Clamp_half(_Power_daf4d77f02ce648e9e473598c24d29d3_Out_2_Float, half(0), half(1), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_258d6dfc5429ec8c98b3380a44764ede_Out_3_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_ac993e99fc82e68c8176cda4658af0cf_Out_3_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_068f89f1f6f13b84a778e1b6fc60b821_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CascadesTexturesRGFoamBNoiseA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_67676bdc2d71838aa03add93a1fcd582_Out_2_Vector2) );
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_R_4_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.r;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.g;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_B_6_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.b;
            half _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_A_7_Float = _SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.tex, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.samplerstate, _Property_be7e3ed3031d2d86accdba51ff3be341_Out_0_Texture2D.GetTransformedUV(_Add_36b0ecfdc70c2a89860e8ffcd342f158_Out_2_Vector2) );
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_R_4_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.r;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.g;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_B_6_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.b;
            half _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_A_7_Float = _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_8d83fa40657c878a8b6151bfdeeecc4e_G_5_Float, _SampleTexture2D_d57511f844f62d8e8e5df4262ed4e29c_G_5_Float, _Absolute_abccf7112257d18a9a55c71637619c70_Out_1_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float;
            Unity_Multiply_half_half(0.5, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float = _BigCascadeNoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float;
            Unity_Power_half(_Absolute_0151c07d6292318bb2b0b40eef5d4bb4_Out_1_Float, _Property_c57b80ca502db789af4f1996fb829a53_Out_0_Float, _Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float = _BigCascadeNoiseMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float;
            Unity_Multiply_half_half(_Power_bcfbc7c00abcb182a829a14c5e9f4d42_Out_2_Float, _Property_acf97c8ef4c39e8e8c70e05a8c49953c_Out_0_Float, _Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float;
            Unity_Clamp_half(_Multiply_24f3f886bab68f83a5b29cde2e2e94d0_Out_2_Float, half(0), half(1), _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float;
            Unity_Lerp_half(_Multiply_69f804f04e80c984997dcb09092c7798_Out_2_Float, _Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Clamp_63b82c1f23c47d81a328645b3f532f82_Out_3_Float, _Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4 = _BigCascadeColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4;
            Unity_Multiply_half4_half4((_Lerp_02599b436ce11d85bfa24dc5005d00b7_Out_3_Float.xxxx), _Property_591498346e50e089aa4db505cd516627_Out_0_Vector4, _Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float;
            Unity_Absolute_half(_Lerp_559b2cf3094b37858a2e54e2e08aa335_Out_3_Float, _Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float = Big_Cascade_Foam_Falloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float;
            Unity_Power_half(_Absolute_792dd1223a136286928cd4b0fdbd9844_Out_1_Float, _Property_21219d8c0f70278698ff2f797020cb45_Out_0_Float, _Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float;
            Unity_Clamp_half(_Power_1b0e31e397f0218bb71a103629ead254_Out_2_Float, half(0), half(1), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float;
            Unity_Lerp_half(half(0), _Clamp_c92dad54caea1f8a9b028c1dd46bd3cd_Out_3_Float, _Clamp_c8349812bf696286b9429cd182d4670a_Out_3_Float, _Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3, (_Multiply_f73b703611c2ee8ea1b712546ec1fdc8_Out_2_Vector4.xyz), (_Lerp_8bce0d19e13b318db02ac1da573c89cb_Out_3_Float.xxx), _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float;
            Unity_Multiply_half_half(_Absolute_2efac825a986e28190f26200795ca9ec_Out_1_Float, _Property_2b0a998dd569ec8eb9ded0f0e64b788e_Out_0_Float, _Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float;
            Unity_Clamp_half(_Multiply_1edb0f98fe3d9f829e4fa0c7bf2e9494_Out_2_Float, half(0), half(1), _Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float;
            Unity_Absolute_half(_Clamp_a887fd61f94cd985a42f3095c5567f4c_Out_3_Float, _Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float;
            Unity_Power_half(_Absolute_07b4cd39c97ab68b97a1a19a034bb68a_Out_1_Float, _Property_5ad189008e5a0186bb74e8c62ddaf1ba_Out_0_Float, _Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float;
            Unity_Clamp_half(_Power_ebc6de3352c7c3878844ee5e23f8f576_Out_2_Float, half(0), half(1), _Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_2dbd0c7b7f4a8982a8431020d52e6d22_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float = _BackfaceAlpha;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float;
            Unity_Multiply_half_half(_Property_eabac5d7ac87d98387d75d4be9794688_Out_0_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            Unity_Branch_half(_IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float, _Multiply_d2a7a46c79641081bf28851db80c21d6_Out_2_Float, _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float);
            #endif
            surface.BaseColor = _Lerp_b22c5b23caf16689b8199ecdaef259d5_Out_3_Vector3;
            surface.Alpha = _Branch_64b824b3a95100869055ff8a632abb7d_Out_3_Float;
            surface.AlphaClipThreshold = half(0);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x < 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #else
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.PixelPosition = float2(input.positionCS.x, (_ProjectionParams.x > 0) ? (_ScaledScreenParams.y - input.positionCS.y) : input.positionCS.y);
        #endif
        
            #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition = output.PixelPosition.xy / _ScaledScreenParams.xy;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.NDCPosition.y = 1.0f - output.NDCPosition.y;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv3 = input.texCoord3;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        #endif
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
    }
    CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
    CustomEditorForRenderPipeline "UnityEditor.ShaderGraphLitGUI" "UnityEngine.Rendering.Universal.UniversalRenderPipelineAsset"
    FallBack "Hidden/Shader Graph/FallbackError"
}