Shader "NatureManufacture Shaders/Water/Water Swamp Vertex Color Flow Mobile"
{
    Properties
    {
        _GlobalTiling("Global Tiling", Range(0.001, 100)) = 1
        [ToggleUI]_UVVDirection1UDirection0("UV Direction - V(T) U(F)", Float) = 1
        _SlowWaterSpeed("Main Water Speed", Vector) = (1, 1, 0, 0)
        _CascadeMainSpeed("Cascade Main Speed", Vector) = (2, 2, 0, 0)
        _Detail1MainSpeed("Detail 1 Main Speed", Vector) = (1, 1, 0, 0)
        _EdgeFalloffMultiply("Edge Falloff Multiply", Float) = 5.19
        _EdgeFalloffPower("Edge Falloff Power", Float) = 0.74
        _CleanFalloffMultiply("Clean Falloff Multiply", Float) = 14.09
        _CleanFalloffPower("Clean Falloff Power", Float) = 0.32
        _ShalowColor("Shalow Color", Color) = (0.1521983, 0.1698113, 0.1289604, 0)
        _ShalowFalloffMultiply("Shalow Falloff Multiply", Float) = 6.03
        _ShalowFalloffPower("Shalow Falloff Power", Float) = 2.34
        _DeepColor("Deep Color", Color) = (0.1029411, 0.08306279, 0.01816609, 0)
        _WaterAlphaMultiply("Water Alpha Multiply", Float) = 0.66
        _WaterAlphaPower("Water Alpha Power", Float) = 1.39
        _WaterSmoothness("Water Smoothness", Range(0, 1)) = 0.9
        _WaterSpecularClose("Water Specular Close", Range(0, 1)) = 0.9
        _WaterSpecularFar("Water Specular Far", Range(0, 1)) = 0.9
        _WaterSpecularThreshold("Water Specular Threshold", Range(0, 10)) = 0.39
        _Distortion("Distortion", Range(0, 1)) = 0.1
        _BackfaceAlpha("Backface Alpha", Range(0, 1)) = 1
        [Normal][NoScaleOffset]_SlowWaterNormal("Water Normal", 2D) = "bump" {}
        _SlowWaterTiling("Water Tiling", Vector) = (3, 3, 0, 0)
        _SlowNormalScale("Water Normal Scale", Float) = 0.2
        _CascadeAngle("Cascade Angle", Range(0.001, 90)) = 15
        _CascadeAngleFalloff("Cascade Angle Falloff", Range(0, 80)) = 0.7
        _CascadeTiling("Cascade Tiling", Vector) = (2, 2, 0, 0)
        _CascadeNormalScale("Cascade Normal Scale", Float) = 0.7
        _CascadeTransparency("Cascade Transparency", Range(0, 1)) = 0
        [NoScaleOffset]_Detail1GSmDetail2ASm("Detail 1 (G)Sm Detail 2 (A)Sm", 2D) = "white" {}
        [NoScaleOffset]_DetailAlbedo("Detail 1 Albedo", 2D) = "white" {}
        _Detail1Tiling("Detail 1 Tiling", Vector) = (3, 3, 0, 0)
        _DetailAlbedoColor("Detail 1 Albedo Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_DetailNormal("Detail 1 Normal", 2D) = "white" {}
        _DetailNormalScale("Detail 1 Normal Scale", Float) = 1
        _DetailSmoothness("Detail 1 Smoothness", Range(0, 1)) = 1
        _Detail1Specular("Detail 1 Specular", Range(0, 1)) = 0
        [NoScaleOffset]_Noise("Noise Detail 1 (G) Detail 2(A)", 2D) = "white" {}
        _NoiseTiling1("Detail 1 Noise Tiling", Vector) = (3, 3, 0, 0)
        _Detail1NoisePower("Detail 1 Noise Power", Range(0, 10)) = 5.48
        _Detail1NoiseMultiply("Detail 1 Noise Multiply", Range(0, 40)) = 5
        _WaterFlowUVRefresSpeed("Water Flow UV Refresh Speed", Range(0, 1)) = 0.059
        _CascadeFlowUVRefreshSpeed("Cascade Flow UV Refresh Speed", Range(0, 1)) = 0.25
        _Detail1FlowUVRefreshSpeed("Detail 1 Flow UV Refresh Speed", Range(0, 1)) = 0.059
        _AOPower("Water AO Power", Range(0, 1)) = 1
        _DetailAOPower("Detail 1 AO Power", Range(0, 1)) = 1
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
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
            half4 _ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
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
            UnityTexture2D _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2 = _Detail1MainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2 = _Detail1Tiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2, (_UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4.xy), _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[0];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[1];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_B_3_Float = 0;
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2 = half2(_Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float, _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2;
            Unity_Branch_half2(_Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean, _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2, _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2, _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float = _Detail1FlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float, _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(1), _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float;
            Unity_Fraction_half(_Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float, _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float;
            Unity_Divide_half(half(1), _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float, _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, (_UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4.xy), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float.xx), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2;
            Unity_Add_half2(_Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4);
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_R_4_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.r;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_G_5_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.g;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_B_6_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.b;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_A_7_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(0.5), _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float;
            Unity_Fraction_half(_Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float, _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2, _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4);
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_R_4_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.r;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_G_5_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.g;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_B_6_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.b;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_A_7_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float;
            Unity_Add_half(_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float, half(-0.5), _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float;
            Unity_Multiply_half_half(_Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float, 2, _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float;
            Unity_Absolute_half(_Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxx), _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailAlbedo);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4;
            Unity_Lerp_half4(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxxx), _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_R_1_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[0];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_G_2_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[1];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_B_3_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[2];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseTiling1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2, (_UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4.xy), _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3c525645edf39a828f48100f53038aba_R_1_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[0];
            half _Split_3c525645edf39a828f48100f53038aba_G_2_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[1];
            half _Split_3c525645edf39a828f48100f53038aba_B_3_Float = 0;
            half _Split_3c525645edf39a828f48100f53038aba_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2 = half2(_Split_3c525645edf39a828f48100f53038aba_G_2_Float, _Split_3c525645edf39a828f48100f53038aba_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2;
            Unity_Branch_half2(_Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean, _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2, _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2, _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float, _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, (_UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4.xy), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float.xx), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2;
            Unity_Add_half2(_Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2) );
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_R_4_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_B_6_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_A_7_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2;
            Unity_Add_half2(_Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2) );
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_R_4_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.r;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.g;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_B_6_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.b;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_A_7_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float, _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float;
            Unity_Absolute_half(_Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float, _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _Detail1NoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _Detail1NoiseMultiply;
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
            half _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float;
            Unity_Multiply_half_half(_Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _CascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _CascadeTiling;
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
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _CascadeFlowUVRefreshSpeed;
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
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _CascadeNormalScale;
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
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
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
            half _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _CascadeAngle;
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
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _CascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[2];
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
            half2 _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2, _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2, 0.0, 1.0)), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
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
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _CascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
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
            half3 _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float, _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float;
            Unity_Clamp_half(_Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float, half(0), half(1), _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float;
            Unity_Power_half(_Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float, _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float, _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float;
            Unity_Clamp_half(_Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float, half(0), half(1), _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float.xxx), _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
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
            half3 _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            #else
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4 = _DetailAlbedoColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4, _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3, _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_63535622d2c1078294dc82bedf5d1068_Out_0_Float = _WaterSpecularFar;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_58acc65275ca2c8bb9b9794515248e77_Out_0_Float = _WaterSpecularClose;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_355acde54fba2f8294a80403c31140d2_Out_1_Float;
            Unity_Absolute_half(_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float, _Absolute_355acde54fba2f8294a80403c31140d2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b27dd4e80027298ca4d5c731ddee1c0d_Out_0_Float = _WaterSpecularThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_7da425e63a736d89bb4ab19de2505206_Out_2_Float;
            Unity_Power_half(_Absolute_355acde54fba2f8294a80403c31140d2_Out_1_Float, _Property_b27dd4e80027298ca4d5c731ddee1c0d_Out_0_Float, _Power_7da425e63a736d89bb4ab19de2505206_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float;
            Unity_Lerp_half(_Property_63535622d2c1078294dc82bedf5d1068_Out_0_Float, _Property_58acc65275ca2c8bb9b9794515248e77_Out_0_Float, _Power_7da425e63a736d89bb4ab19de2505206_Out_2_Float, _Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_62c27b8723883c8a945e90605fbbc91c_Out_0_Float = _Detail1Specular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_58c39e8f6f1ae284893f899d168f9ce4_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4, (_Property_62c27b8723883c8a945e90605fbbc91c_Out_0_Float.xxxx), _Multiply_58c39e8f6f1ae284893f899d168f9ce4_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Detail1GSmDetail2ASm);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.tex, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.samplerstate, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_R_4_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.r;
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_G_5_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.g;
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_B_6_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.b;
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_A_7_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.tex, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.samplerstate, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_R_4_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.r;
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_G_5_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.g;
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_B_6_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.b;
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_A_7_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_c9bf53d682847284950a04e1c04747c3_G_5_Float, _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_6021bf1984da36828413ded248491830_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Multiply_58c39e8f6f1ae284893f899d168f9ce4_Out_2_Vector4, (_Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float.xxxx), _Multiply_6021bf1984da36828413ded248491830_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_3478f3237a1190879757cb19edd9f669_Out_3_Vector4;
            Unity_Lerp_half4((_Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float.xxxx), _Multiply_6021bf1984da36828413ded248491830_Out_2_Vector4, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxxx), _Lerp_3478f3237a1190879757cb19edd9f669_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_8b467cc75f9f098fb8a4d27df0ad20b6_Out_3_Vector4;
            Unity_Lerp_half4(_Lerp_3478f3237a1190879757cb19edd9f669_Out_3_Vector4, (_Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float.xxxx), (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxxx), _Lerp_8b467cc75f9f098fb8a4d27df0ad20b6_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float = _WaterSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float = _DetailSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_64af56649b000a8abbbdce701b680684_Out_2_Float;
            Unity_Multiply_half_half(_Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float, _Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float, _Multiply_64af56649b000a8abbbdce701b680684_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float;
            Unity_Lerp_half(_Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float, _Multiply_64af56649b000a8abbbdce701b680684_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float, _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_25329ab08f15d6879f23fbac4ede75b6_Out_3_Float;
            Unity_Lerp_half(_Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float, _Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_25329ab08f15d6879f23fbac4ede75b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float = _AOPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_1ac1d84ba6189180b4c660af01175471_Out_0_Float = _DetailAOPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_d393aed0133e6583aa1279d6c17626aa_Out_3_Float;
            Unity_Lerp_half(_Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float, _Property_1ac1d84ba6189180b4c660af01175471_Out_0_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float, _Lerp_d393aed0133e6583aa1279d6c17626aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_bff67b1f1a1de98d8a8ba5265751345c_Out_3_Float;
            Unity_Lerp_half(_Lerp_d393aed0133e6583aa1279d6c17626aa_Out_3_Float, _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_bff67b1f1a1de98d8a8ba5265751345c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
            surface.BaseColor = _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            surface.NormalTS = _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            surface.Emission = half3(0, 0, 0);
            surface.Metallic = half(0);
            surface.Specular = (_Lerp_8b467cc75f9f098fb8a4d27df0ad20b6_Out_3_Vector4.xyz);
            surface.Smoothness = _Lerp_25329ab08f15d6879f23fbac4ede75b6_Out_3_Float;
            surface.Occlusion = _Lerp_bff67b1f1a1de98d8a8ba5265751345c_Out_3_Float;
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
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
            half4 _ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
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
            UnityTexture2D _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2 = _Detail1MainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2 = _Detail1Tiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2, (_UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4.xy), _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[0];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[1];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_B_3_Float = 0;
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2 = half2(_Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float, _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2;
            Unity_Branch_half2(_Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean, _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2, _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2, _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float = _Detail1FlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float, _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(1), _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float;
            Unity_Fraction_half(_Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float, _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float;
            Unity_Divide_half(half(1), _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float, _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, (_UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4.xy), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float.xx), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2;
            Unity_Add_half2(_Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4);
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_R_4_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.r;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_G_5_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.g;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_B_6_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.b;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_A_7_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(0.5), _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float;
            Unity_Fraction_half(_Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float, _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2, _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4);
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_R_4_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.r;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_G_5_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.g;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_B_6_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.b;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_A_7_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float;
            Unity_Add_half(_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float, half(-0.5), _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float;
            Unity_Multiply_half_half(_Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float, 2, _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float;
            Unity_Absolute_half(_Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxx), _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailAlbedo);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4;
            Unity_Lerp_half4(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxxx), _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_R_1_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[0];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_G_2_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[1];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_B_3_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[2];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseTiling1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2, (_UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4.xy), _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3c525645edf39a828f48100f53038aba_R_1_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[0];
            half _Split_3c525645edf39a828f48100f53038aba_G_2_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[1];
            half _Split_3c525645edf39a828f48100f53038aba_B_3_Float = 0;
            half _Split_3c525645edf39a828f48100f53038aba_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2 = half2(_Split_3c525645edf39a828f48100f53038aba_G_2_Float, _Split_3c525645edf39a828f48100f53038aba_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2;
            Unity_Branch_half2(_Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean, _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2, _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2, _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float, _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, (_UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4.xy), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float.xx), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2;
            Unity_Add_half2(_Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2) );
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_R_4_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_B_6_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_A_7_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2;
            Unity_Add_half2(_Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2) );
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_R_4_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.r;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.g;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_B_6_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.b;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_A_7_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float, _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float;
            Unity_Absolute_half(_Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float, _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _Detail1NoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _Detail1NoiseMultiply;
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
            half _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float;
            Unity_Multiply_half_half(_Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _CascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _CascadeTiling;
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
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _CascadeFlowUVRefreshSpeed;
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
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _CascadeNormalScale;
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
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
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
            half _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _CascadeAngle;
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
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _CascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[2];
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
            half2 _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2, _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2, 0.0, 1.0)), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
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
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _CascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
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
            half3 _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float, _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float;
            Unity_Clamp_half(_Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float, half(0), half(1), _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float;
            Unity_Power_half(_Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float, _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float, _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float;
            Unity_Clamp_half(_Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float, half(0), half(1), _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float.xxx), _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
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
            half3 _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            #else
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4 = _DetailAlbedoColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4, _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3, _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_63535622d2c1078294dc82bedf5d1068_Out_0_Float = _WaterSpecularFar;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_58acc65275ca2c8bb9b9794515248e77_Out_0_Float = _WaterSpecularClose;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_355acde54fba2f8294a80403c31140d2_Out_1_Float;
            Unity_Absolute_half(_Clamp_f5baa0daace6e28ea726519de4641bc4_Out_3_Float, _Absolute_355acde54fba2f8294a80403c31140d2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_b27dd4e80027298ca4d5c731ddee1c0d_Out_0_Float = _WaterSpecularThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_7da425e63a736d89bb4ab19de2505206_Out_2_Float;
            Unity_Power_half(_Absolute_355acde54fba2f8294a80403c31140d2_Out_1_Float, _Property_b27dd4e80027298ca4d5c731ddee1c0d_Out_0_Float, _Power_7da425e63a736d89bb4ab19de2505206_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float;
            Unity_Lerp_half(_Property_63535622d2c1078294dc82bedf5d1068_Out_0_Float, _Property_58acc65275ca2c8bb9b9794515248e77_Out_0_Float, _Power_7da425e63a736d89bb4ab19de2505206_Out_2_Float, _Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_62c27b8723883c8a945e90605fbbc91c_Out_0_Float = _Detail1Specular;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_58c39e8f6f1ae284893f899d168f9ce4_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4, (_Property_62c27b8723883c8a945e90605fbbc91c_Out_0_Float.xxxx), _Multiply_58c39e8f6f1ae284893f899d168f9ce4_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Detail1GSmDetail2ASm);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.tex, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.samplerstate, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_R_4_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.r;
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_G_5_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.g;
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_B_6_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.b;
            half _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_A_7_Float = _SampleTexture2D_c9bf53d682847284950a04e1c04747c3_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.tex, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.samplerstate, _Property_52ce156cef1fd582ab31bd16834fa412_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_R_4_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.r;
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_G_5_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.g;
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_B_6_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.b;
            half _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_A_7_Float = _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_c9bf53d682847284950a04e1c04747c3_G_5_Float, _SampleTexture2D_c944abf6fb0fa982b1824648dd691818_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_6021bf1984da36828413ded248491830_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Multiply_58c39e8f6f1ae284893f899d168f9ce4_Out_2_Vector4, (_Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float.xxxx), _Multiply_6021bf1984da36828413ded248491830_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_3478f3237a1190879757cb19edd9f669_Out_3_Vector4;
            Unity_Lerp_half4((_Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float.xxxx), _Multiply_6021bf1984da36828413ded248491830_Out_2_Vector4, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxxx), _Lerp_3478f3237a1190879757cb19edd9f669_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_8b467cc75f9f098fb8a4d27df0ad20b6_Out_3_Vector4;
            Unity_Lerp_half4(_Lerp_3478f3237a1190879757cb19edd9f669_Out_3_Vector4, (_Lerp_e57c831d226a318698c747d1d4c464a7_Out_3_Float.xxxx), (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxxx), _Lerp_8b467cc75f9f098fb8a4d27df0ad20b6_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float = _WaterSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float = _DetailSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_64af56649b000a8abbbdce701b680684_Out_2_Float;
            Unity_Multiply_half_half(_Property_19729c3fad203984b63630ce8edabf9d_Out_0_Float, _Lerp_21e9a49fce26b48183d18b2796da8e43_Out_3_Float, _Multiply_64af56649b000a8abbbdce701b680684_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float;
            Unity_Lerp_half(_Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float, _Multiply_64af56649b000a8abbbdce701b680684_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float, _Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_25329ab08f15d6879f23fbac4ede75b6_Out_3_Float;
            Unity_Lerp_half(_Lerp_cc8bb9fe6e021f8b98329d6377ba7058_Out_3_Float, _Property_23e147d5684b0c89a7767d3573b12dbd_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_25329ab08f15d6879f23fbac4ede75b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float = _AOPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_1ac1d84ba6189180b4c660af01175471_Out_0_Float = _DetailAOPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_d393aed0133e6583aa1279d6c17626aa_Out_3_Float;
            Unity_Lerp_half(_Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float, _Property_1ac1d84ba6189180b4c660af01175471_Out_0_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float, _Lerp_d393aed0133e6583aa1279d6c17626aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_bff67b1f1a1de98d8a8ba5265751345c_Out_3_Float;
            Unity_Lerp_half(_Lerp_d393aed0133e6583aa1279d6c17626aa_Out_3_Float, _Property_2cfdd8606d404f84b73185f1663b8068_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Lerp_bff67b1f1a1de98d8a8ba5265751345c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
            surface.BaseColor = _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            surface.NormalTS = _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            surface.Emission = half3(0, 0, 0);
            surface.Metallic = half(0);
            surface.Specular = (_Lerp_8b467cc75f9f098fb8a4d27df0ad20b6_Out_3_Vector4.xyz);
            surface.Smoothness = _Lerp_25329ab08f15d6879f23fbac4ede75b6_Out_3_Float;
            surface.Occlusion = _Lerp_bff67b1f1a1de98d8a8ba5265751345c_Out_3_Float;
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
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
            UnityTexture2D _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2 = _Detail1MainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2 = _Detail1Tiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2, (_UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4.xy), _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[0];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[1];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_B_3_Float = 0;
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2 = half2(_Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float, _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2;
            Unity_Branch_half2(_Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean, _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2, _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2, _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float = _Detail1FlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float, _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(1), _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float;
            Unity_Fraction_half(_Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float, _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float;
            Unity_Divide_half(half(1), _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float, _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, (_UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4.xy), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float.xx), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2;
            Unity_Add_half2(_Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4);
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_R_4_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.r;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_G_5_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.g;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_B_6_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.b;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_A_7_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(0.5), _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float;
            Unity_Fraction_half(_Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float, _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2, _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4);
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_R_4_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.r;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_G_5_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.g;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_B_6_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.b;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_A_7_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float;
            Unity_Add_half(_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float, half(-0.5), _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float;
            Unity_Multiply_half_half(_Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float, 2, _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float;
            Unity_Absolute_half(_Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxx), _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailAlbedo);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4;
            Unity_Lerp_half4(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxxx), _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_R_1_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[0];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_G_2_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[1];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_B_3_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[2];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseTiling1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2, (_UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4.xy), _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3c525645edf39a828f48100f53038aba_R_1_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[0];
            half _Split_3c525645edf39a828f48100f53038aba_G_2_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[1];
            half _Split_3c525645edf39a828f48100f53038aba_B_3_Float = 0;
            half _Split_3c525645edf39a828f48100f53038aba_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2 = half2(_Split_3c525645edf39a828f48100f53038aba_G_2_Float, _Split_3c525645edf39a828f48100f53038aba_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2;
            Unity_Branch_half2(_Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean, _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2, _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2, _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float, _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, (_UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4.xy), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float.xx), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2;
            Unity_Add_half2(_Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2) );
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_R_4_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_B_6_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_A_7_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2;
            Unity_Add_half2(_Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2) );
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_R_4_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.r;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.g;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_B_6_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.b;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_A_7_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float, _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float;
            Unity_Absolute_half(_Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float, _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _Detail1NoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _Detail1NoiseMultiply;
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
            half _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float;
            Unity_Multiply_half_half(_Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _CascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _CascadeTiling;
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
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _CascadeFlowUVRefreshSpeed;
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
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _CascadeNormalScale;
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
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
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
            half _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _CascadeAngle;
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
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _CascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
            surface.NormalTS = _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
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
            half4 _ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
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
            UnityTexture2D _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2 = _Detail1MainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2 = _Detail1Tiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2, (_UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4.xy), _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[0];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[1];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_B_3_Float = 0;
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2 = half2(_Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float, _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2;
            Unity_Branch_half2(_Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean, _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2, _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2, _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float = _Detail1FlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float, _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(1), _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float;
            Unity_Fraction_half(_Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float, _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float;
            Unity_Divide_half(half(1), _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float, _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, (_UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4.xy), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float.xx), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2;
            Unity_Add_half2(_Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4);
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_R_4_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.r;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_G_5_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.g;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_B_6_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.b;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_A_7_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(0.5), _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float;
            Unity_Fraction_half(_Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float, _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2, _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4);
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_R_4_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.r;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_G_5_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.g;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_B_6_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.b;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_A_7_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float;
            Unity_Add_half(_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float, half(-0.5), _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float;
            Unity_Multiply_half_half(_Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float, 2, _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float;
            Unity_Absolute_half(_Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxx), _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailAlbedo);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4;
            Unity_Lerp_half4(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxxx), _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_R_1_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[0];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_G_2_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[1];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_B_3_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[2];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseTiling1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2, (_UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4.xy), _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3c525645edf39a828f48100f53038aba_R_1_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[0];
            half _Split_3c525645edf39a828f48100f53038aba_G_2_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[1];
            half _Split_3c525645edf39a828f48100f53038aba_B_3_Float = 0;
            half _Split_3c525645edf39a828f48100f53038aba_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2 = half2(_Split_3c525645edf39a828f48100f53038aba_G_2_Float, _Split_3c525645edf39a828f48100f53038aba_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2;
            Unity_Branch_half2(_Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean, _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2, _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2, _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float, _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, (_UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4.xy), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float.xx), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2;
            Unity_Add_half2(_Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2) );
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_R_4_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_B_6_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_A_7_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2;
            Unity_Add_half2(_Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2) );
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_R_4_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.r;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.g;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_B_6_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.b;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_A_7_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float, _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float;
            Unity_Absolute_half(_Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float, _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _Detail1NoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _Detail1NoiseMultiply;
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
            half _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float;
            Unity_Multiply_half_half(_Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _CascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _CascadeTiling;
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
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _CascadeFlowUVRefreshSpeed;
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
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _CascadeNormalScale;
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
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
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
            half _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _CascadeAngle;
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
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _CascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[2];
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
            half2 _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2, _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2, 0.0, 1.0)), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
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
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _CascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
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
            half3 _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float, _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float;
            Unity_Clamp_half(_Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float, half(0), half(1), _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float;
            Unity_Power_half(_Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float, _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float, _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float;
            Unity_Clamp_half(_Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float, half(0), half(1), _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float.xxx), _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
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
            half3 _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            #else
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4 = _DetailAlbedoColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4, _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3, _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
            surface.BaseColor = _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            surface.Emission = half3(0, 0, 0);
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
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
            half4 _ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
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
            UnityTexture2D _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2 = _Detail1MainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2 = _Detail1Tiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2, (_UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4.xy), _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[0];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[1];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_B_3_Float = 0;
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2 = half2(_Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float, _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2;
            Unity_Branch_half2(_Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean, _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2, _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2, _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float = _Detail1FlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float, _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(1), _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float;
            Unity_Fraction_half(_Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float, _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float;
            Unity_Divide_half(half(1), _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float, _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, (_UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4.xy), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float.xx), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2;
            Unity_Add_half2(_Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4);
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_R_4_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.r;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_G_5_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.g;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_B_6_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.b;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_A_7_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(0.5), _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float;
            Unity_Fraction_half(_Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float, _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2, _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4);
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_R_4_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.r;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_G_5_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.g;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_B_6_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.b;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_A_7_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float;
            Unity_Add_half(_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float, half(-0.5), _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float;
            Unity_Multiply_half_half(_Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float, 2, _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float;
            Unity_Absolute_half(_Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxx), _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailAlbedo);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4;
            Unity_Lerp_half4(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxxx), _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_R_1_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[0];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_G_2_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[1];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_B_3_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[2];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseTiling1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2, (_UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4.xy), _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3c525645edf39a828f48100f53038aba_R_1_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[0];
            half _Split_3c525645edf39a828f48100f53038aba_G_2_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[1];
            half _Split_3c525645edf39a828f48100f53038aba_B_3_Float = 0;
            half _Split_3c525645edf39a828f48100f53038aba_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2 = half2(_Split_3c525645edf39a828f48100f53038aba_G_2_Float, _Split_3c525645edf39a828f48100f53038aba_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2;
            Unity_Branch_half2(_Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean, _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2, _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2, _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float, _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, (_UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4.xy), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float.xx), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2;
            Unity_Add_half2(_Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2) );
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_R_4_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_B_6_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_A_7_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2;
            Unity_Add_half2(_Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2) );
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_R_4_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.r;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.g;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_B_6_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.b;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_A_7_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float, _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float;
            Unity_Absolute_half(_Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float, _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _Detail1NoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _Detail1NoiseMultiply;
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
            half _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float;
            Unity_Multiply_half_half(_Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _CascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _CascadeTiling;
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
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _CascadeFlowUVRefreshSpeed;
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
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _CascadeNormalScale;
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
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
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
            half _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _CascadeAngle;
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
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _CascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[2];
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
            half2 _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2, _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2, 0.0, 1.0)), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
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
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _CascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
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
            half3 _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float, _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float;
            Unity_Clamp_half(_Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float, half(0), half(1), _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float;
            Unity_Power_half(_Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float, _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float, _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float;
            Unity_Clamp_half(_Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float, half(0), half(1), _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float.xxx), _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
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
            half3 _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            #else
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4 = _DetailAlbedoColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4, _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3, _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
            surface.BaseColor = _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
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
        half2 _CascadeMainSpeed;
        half2 _Detail1MainSpeed;
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
        half _WaterSmoothness;
        half _WaterSpecularClose;
        half _WaterSpecularFar;
        half _WaterSpecularThreshold;
        half _Distortion;
        half _BackfaceAlpha;
        float4 _SlowWaterNormal_TexelSize;
        half2 _SlowWaterTiling;
        half _SlowNormalScale;
        half _CascadeAngle;
        half _CascadeAngleFalloff;
        half2 _CascadeTiling;
        half _CascadeNormalScale;
        half _CascadeTransparency;
        float4 _Detail1GSmDetail2ASm_TexelSize;
        float4 _DetailAlbedo_TexelSize;
        half2 _Detail1Tiling;
        half4 _DetailAlbedoColor;
        float4 _DetailNormal_TexelSize;
        half _DetailNormalScale;
        half _DetailSmoothness;
        half _Detail1Specular;
        float4 _Noise_TexelSize;
        half2 _NoiseTiling1;
        half _Detail1NoisePower;
        half _Detail1NoiseMultiply;
        half _WaterFlowUVRefresSpeed;
        half _CascadeFlowUVRefreshSpeed;
        half _Detail1FlowUVRefreshSpeed;
        half _AOPower;
        half _DetailAOPower;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_SlowWaterNormal);
        SAMPLER(sampler_SlowWaterNormal);
        TEXTURE2D(_Detail1GSmDetail2ASm);
        SAMPLER(sampler_Detail1GSmDetail2ASm);
        TEXTURE2D(_DetailAlbedo);
        SAMPLER(sampler_DetailAlbedo);
        TEXTURE2D(_DetailNormal);
        SAMPLER(sampler_DetailNormal);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
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
        
        void Unity_Lerp_half4(half4 A, half4 B, half4 T, out half4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_half(half A, half B, half T, out half Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Power_half(half A, half B, out half Out)
        {
            Out = pow(A, B);
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
            half4 _ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4 = half4(IN.NDCPosition.xy, 0, 0);
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
            UnityTexture2D _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2 = _Detail1MainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2 = _Detail1Tiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, _Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_7d4c6e5b4b103e8290efb2821293f346_Out_2_Vector2, (_UV_203923fff535a8868a9b5eb7c1151d03_Out_0_Vector4.xy), _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[0];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float = _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2[1];
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_B_3_Float = 0;
            half _Split_f5d1cae975ceee85ac0ab596bb68b03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2 = half2(_Split_f5d1cae975ceee85ac0ab596bb68b03b_G_2_Float, _Split_f5d1cae975ceee85ac0ab596bb68b03b_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2;
            Unity_Branch_half2(_Property_d8c2f99c6f677e8d9d633c89b4604d29_Out_0_Boolean, _Multiply_674fd22f90faf28eada5a3f3a14b2efc_Out_2_Vector2, _Vector2_bba5c9a7bbe5f98aa494aa678d722fd4_Out_0_Vector2, _Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float = _Detail1FlowUVRefreshSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float;
            Unity_Multiply_half_half(IN.TimeParameters.x, _Property_6596ba1128abc48492cbda5d27f00783_Out_0_Float, _Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(1), _Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float;
            Unity_Fraction_half(_Add_5fdb64d83ac5528ebdf528ebad30839b_Out_2_Float, _Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float;
            Unity_Divide_half(half(1), _Property_fe192cfd741bc18db574648572ee8de7_Out_0_Float, _Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_8e2412712aaa8a8eb0b2b5cc45a5e199_Out_0_Vector2, (_UV_fafd4cecadeadc80b4351e1ca68792b4_Out_0_Vector4.xy), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_b66fb7c71049b7889fa6c1b51d95576f_Out_2_Float.xx), _Multiply_c3db9a3c6955918ba005c23793df6bc7_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2;
            Unity_Add_half2(_Multiply_7ed321cb0a55c18e83ae2632742b0ceb_Out_2_Vector2, _Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4);
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_R_4_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.r;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_G_5_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.g;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_B_6_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.b;
            half _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_A_7_Float = _SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_52845cba8832a48bb2eeeb95c11be9b6_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float;
            Unity_Add_half(_Multiply_8f7b5c44330cb4879769c4f0bdcad7b8_Out_2_Float, half(0.5), _Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float;
            Unity_Fraction_half(_Add_a26619a862bef889b0e8fbb235a97e11_Out_2_Float, _Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_1b56fbceef10308ea98b620d8d934238_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2;
            Unity_Add_half2(_Multiply_5959f855660fc185a6f139da1f020718_Out_2_Vector2, _Multiply_737389442060be88bf766cc9a747eb5b_Out_2_Vector2, _Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_043ba2b05f3d35839cb16fde59eeae5f_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4);
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_R_4_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.r;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_G_5_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.g;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_B_6_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.b;
            half _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_A_7_Float = _SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3;
            Unity_NormalStrength_half((_SampleTexture2D_7cf7a40a3f9f9a83892b408086106bf8_RGBA_0_Vector4.xyz), _Property_3dbb1a4656416484bafe9c560d122c0b_Out_0_Float, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float;
            Unity_Add_half(_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float, half(-0.5), _Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float;
            Unity_Multiply_half_half(_Add_09bb76d02a78d88ba42235d396eb5886_Out_2_Float, 2, _Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float;
            Unity_Absolute_half(_Multiply_e39f8c61155f408895177a50610c1cfb_Out_2_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3;
            Unity_Lerp_half3(_NormalStrength_e211a3b193b597818bc4b8c05743bcb1_Out_2_Vector3, _NormalStrength_1e1eb44756b71b8aa40e56fa7b46213d_Out_2_Vector3, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxx), _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailAlbedo);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_82a37390dea95e8da41c8f98f6b0b777_Out_2_Vector2) );
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_R_4_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.r;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_G_5_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.g;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_B_6_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.b;
            half _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_A_7_Float = _SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.tex, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.samplerstate, _Property_416b2573e211708fb7af409507174e09_Out_0_Texture2D.GetTransformedUV(_Add_a161553ac1dc4184b3aa388708f4af8a_Out_2_Vector2) );
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_R_4_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.r;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_G_5_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.g;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_B_6_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.b;
            half _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_A_7_Float = _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4;
            Unity_Lerp_half4(_SampleTexture2D_81669c6dd85bd2879473510bc4f9109e_RGBA_0_Vector4, _SampleTexture2D_4a602e59b5c2cd82b26c6532c5dec4bb_RGBA_0_Vector4, (_Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float.xxxx), _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_R_1_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[0];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_G_2_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[1];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_B_3_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[2];
            half _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float = _Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2 = _NoiseTiling1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_fc8d48a18caff38891339112deedd3e5_Out_0_Vector2, _Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, _Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4 = IN.uv3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Multiply_4970cf632744578ea3f71e37f5b93852_Out_2_Vector2, (_UV_ccc13cfb35f6f988bbc8f1e4954b2539_Out_0_Vector4.xy), _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_3c525645edf39a828f48100f53038aba_R_1_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[0];
            half _Split_3c525645edf39a828f48100f53038aba_G_2_Float = _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2[1];
            half _Split_3c525645edf39a828f48100f53038aba_B_3_Float = 0;
            half _Split_3c525645edf39a828f48100f53038aba_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2 = half2(_Split_3c525645edf39a828f48100f53038aba_G_2_Float, _Split_3c525645edf39a828f48100f53038aba_R_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2;
            Unity_Branch_half2(_Property_17a9fae5881a31819f121426c4186022_Out_0_Boolean, _Multiply_9445bdfddcd36b839d3ebfe855c64262_Out_2_Vector2, _Vector2_15067fbbdda0b0888e933b98c2b456ed_Out_0_Vector2, _Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_473f8e25e5b356819c5f7f2ee14b1a76_Out_1_Float.xx), _Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float = _GlobalTiling;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float;
            Unity_Divide_half(half(1), _Property_e9fcd0bbaf698786aca1125753b1769d_Out_0_Float, _Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Property_2403c4653638e68c82c8f95ce75b38d2_Out_0_Vector2, (_UV_d1f402cf2e9d2181ab904eb3f0acaf7a_Out_0_Vector4.xy), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2;
            Unity_Multiply_half2_half2((_Divide_851d5fc7fb4ddd8fa4a55e500ba8a23e_Out_2_Float.xx), _Multiply_c4bfe8996dcfce888d79542b6e692ea2_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2;
            Unity_Add_half2(_Multiply_01bb6b481160af8fb934a0d602ea70ae_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_405f2f2433358285b684a48b91b61bcf_Out_2_Vector2) );
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_R_4_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.r;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.g;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_B_6_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.b;
            half _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_A_7_Float = _SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2;
            Unity_Multiply_half2_half2(_Branch_90a710bd6964728c96474d909bfc3809_Out_3_Vector2, (_Fraction_3afd1d3e535a6089ba496e5730f57e7a_Out_1_Float.xx), _Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2;
            Unity_Add_half2(_Multiply_4c26af15e993ad8b889cb0be0fd5cbb1_Out_2_Vector2, _Multiply_8e10f50f95affe85864bb8dea57a83ad_Out_2_Vector2, _Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.tex, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.samplerstate, _Property_15c76893db2007869aef9944cbead979_Out_0_Texture2D.GetTransformedUV(_Add_0981805b52d5f08abdab548e75da979f_Out_2_Vector2) );
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_R_4_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.r;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.g;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_B_6_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.b;
            half _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_A_7_Float = _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float;
            Unity_Lerp_half(_SampleTexture2D_ad70cf600f205e8f82d58922f78b818b_G_5_Float, _SampleTexture2D_ba01ead58f5ee189b1105d7486fa4fc1_G_5_Float, _Absolute_cc4084cfd4a1ed87b053f8b424978a75_Out_1_Float, _Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float;
            Unity_Absolute_half(_Lerp_879af1e047b5be81a661604b2997cee9_Out_3_Float, _Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float = _Detail1NoisePower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float;
            Unity_Power_half(_Absolute_8bba0a674a482d84a9b0783d4e75c1e1_Out_1_Float, _Property_c588249dcbc47d8d9535705b05921b71_Out_0_Float, _Power_8bca46078c439783ba234de17d8dbe27_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_85bf6216e686fd8a80460e8fa62f59ac_Out_0_Float = _Detail1NoiseMultiply;
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
            half _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float;
            Unity_Multiply_half_half(_Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Clamp_82f5b62da2a50a86993ed93d824fc156_Out_3_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float;
            Unity_Lerp_half(half(0), _Split_9c9b54a4be912480b494fbc27eda3ea7_A_4_Float, _Multiply_5797281585a9e38b8c1229061a3c3985_Out_2_Float, _Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_63c09ae12140de8da5d72b0b88f55a50_Out_3_Vector3, _Lerp_e34392e5ac265e85a956013bfafbfc15_Out_3_Vector3, (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_SlowWaterNormal);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_ac1c529019c9d1869d9bfe9bf1104042_Out_0_Boolean = _UVVDirection1UDirection0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_8774276f674d8a8598020af3d4e74f0f_Out_0_Vector2 = _CascadeMainSpeed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Property_4a73de4bbed00585a919d64e1b181601_Out_0_Vector2 = _CascadeTiling;
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
            half _Property_a13ee271968db284868bea327ce6cf48_Out_0_Float = _CascadeFlowUVRefreshSpeed;
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
            half4 _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_ab2fbb5d62416f8a8395247b1abd0edb_Out_2_Vector2) );
            _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4);
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_R_4_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.r;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_G_5_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.g;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_B_6_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.b;
            half _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_A_7_Float = _SampleTexture2D_4f3a718c2123288ea2ba36a9344e64e9_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_c488bf556481e28d8a97898896b5cdec_Out_0_Float = _CascadeNormalScale;
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
            half4 _SampleTexture2D_e0bdc3ec5369e88bab241bd5157590f1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_7f7b24f1d41c1082a4217844329c30b2_Out_0_Texture2D.GetTransformedUV(_Add_5b1693e6737d608d8875d9528a4320b8_Out_2_Vector2) );
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
            half _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float;
            Unity_Absolute_half(_Split_e8815c5687c0c188b222e57b486e0e5d_G_2_Float, _Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float;
            Unity_Clamp_half(_Absolute_722ad5eb6c294381b6ed66d32f3af052_Out_1_Float, half(0), half(1), _Clamp_6461e1158ec9fc888d6226acfef2903e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_f6e7c7b7064d56849dcc327504a5af65_Out_0_Float = _CascadeAngle;
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
            half _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float = _CascadeAngleFalloff;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float;
            Unity_Power_half(_Absolute_7b20625d60e2458b89c9ca794a5039a5_Out_1_Float, _Property_f6203e15e471e481b8369ee14c1cf745_Out_0_Float, _Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float;
            Unity_Clamp_half(_Power_1bc1b18487206481a5ce3274075c24a1_Out_2_Float, half(0), half(1), _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_05bb78033b741c8c9c3df2f30a703e37_Out_3_Vector3, _Lerp_dd9598f6e61c5d85886c8f9a886b7d1b_Out_3_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3;
            Unity_Normalize_half3(_Lerp_00bd3612d8d54981a742936c25caa9ab_Out_3_Vector3, _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_68246b194708098988894c52ed841038_R_1_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[0];
            half _Split_68246b194708098988894c52ed841038_G_2_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[1];
            half _Split_68246b194708098988894c52ed841038_B_3_Float = _Normalize_a56e4ff498bb8989a35aa7d5def5e303_Out_1_Vector3[2];
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
            half2 _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2;
            Unity_Multiply_half2_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_cea681d75736c38b93219ae5b57431a3_Out_2_Vector2, _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half2 _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2;
            Unity_Add_half2((_ScreenPosition_a71078012d336285834d3aa684884030_Out_0_Vector4.xy), _Multiply_0caecdd55c692386a68cc90d364915e3_Out_2_Vector2, _Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3;
            Unity_SceneColor_half((half4(_Add_5326101c4328ec88950be5ca053df5fa_Out_2_Vector2, 0.0, 1.0)), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_4bd0c6ca665a3d8c94ecdc6712294e47_Out_0_Vector4 = _DeepColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_7094041d89afbd878cb83460f4ab68b8_Out_0_Vector4 = _ShalowColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.ScreenPosition = IN.ScreenPosition;
            _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05.NDCPosition = IN.NDCPosition;
            half _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float;
            SG_DepthTestSimple_72d4a6225367af944a721a0ade79db87_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05, _DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float = _ShalowFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d45faccb9a8eb38699cf047ce0e1bb91_Out_0_Float, _Multiply_09842a1e2e3dab8097df031fcbac3009_Out_2_Float);
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
            half _Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float = _CascadeTransparency;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float;
            Unity_Multiply_half_half(_Property_2a04c32f33fb1c8a8d487c1c18a0f672_Out_0_Float, _Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float, _Multiply_097cbada59f56b8b81826bc433f0d8e5_Out_2_Float);
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
            half3 _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3;
            Unity_Multiply_half3_half3((_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), _SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float = _WaterAlphaMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_d168fbf19bf31a82a139cd84c2ec6460_Out_0_Float, _Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float;
            Unity_Clamp_half(_Multiply_475d2f350dc75d878f81209d5770173e_Out_2_Float, half(0), half(1), _Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float = _WaterAlphaPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float;
            Unity_Power_half(_Clamp_3941e297c7259c878ca5cfca1a42e30d_Out_3_Float, _Property_6909cb286a8ffd88a797d6a0738c17a8_Out_0_Float, _Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float;
            Unity_Clamp_half(_Power_8badee4bb5cf848781cee047125b53ff_Out_2_Float, half(0), half(1), _Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3;
            Unity_Lerp_half3(_Multiply_15ac035681ee8c828a360e023f142fdd_Out_2_Vector3, (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz), (_Clamp_df0d6decf9092f8f9102de7dba377b7e_Out_3_Float.xxx), _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float = _CleanFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_a887c93266ebda8fbf7fa2426fd08088_Out_0_Float, _Multiply_1727b2cc4cab2b889161b05cede2a830_Out_2_Float);
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
            half3 _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            Unity_Lerp_half3(_SceneColor_acb20acd16cc3c8284833048b5589b5b_Out_1_Vector3, _Lerp_be936ece0349cd88b47646863fbc0f89_Out_3_Vector3, (_Clamp_1b643e9f17afdf8eb0042c0268373325_Out_3_Float.xxx), _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_DISTORTION_ON)
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = _Lerp_e9ce25ec1486fe8ba736501702723736_Out_3_Vector3;
            #else
            half3 _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3 = (_Lerp_bff7238223fec786b08d9cf92a09754c_Out_3_Vector4.xyz);
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4 = _DetailAlbedoColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half4 _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4;
            Unity_Multiply_half4_half4(_Lerp_1c2c6a7288ae4d8897b747aa57fd690b_Out_3_Vector4, _Property_0a64a78237b57c87bcd611a64136cc8c_Out_0_Vector4, _Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3;
            Unity_Lerp_half3(_UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Multiply_16971dced2f6f384b7d2d65006f03b46_Out_2_Vector4.xyz), (_Lerp_f90f4bd684cc2f86a45663ddff0717f1_Out_3_Float.xxx), _Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half3 _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
            Unity_Lerp_half3(_Lerp_dbc6bd2113226f869041ff87c02d1f78_Out_3_Vector3, _UseDistortion_41d8cb18aa714b8cb6330b57c7bef5a0_Out_0_Vector3, (_Clamp_08c896054837bb88bc0374bd536ee024_Out_3_Float.xxx), _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _IsFrontFace_ea598b2f7b64288e80a923a5552fbe53_Out_0_Boolean = max(0, IN.FaceSign.x);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_75b411b257598d819b5e01953386142f_Out_0_Float = _EdgeFalloffMultiply;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float;
            Unity_Multiply_half_half(_DepthTestSimple_62eff2a8bfc84cdf9e466f8faff69c05_OutDepth_1_Float, _Property_75b411b257598d819b5e01953386142f_Out_0_Float, _Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float;
            Unity_Clamp_half(_Multiply_4eaeb3304bf34a8b921e61abc302b70e_Out_2_Float, half(0), half(1), _Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float;
            Unity_Absolute_half(_Clamp_2ec6b566ee01ae8c8412d6f1a30bf76c_Out_3_Float, _Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float = _EdgeFalloffPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float;
            Unity_Power_half(_Absolute_ade2235a0baaa486845550beb6a984b4_Out_1_Float, _Property_04d5c9a9378bc78b9adc87ea3b29ca71_Out_0_Float, _Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float;
            Unity_Clamp_half(_Power_0d9897c92d61b980bf1d5a4ec2e973bf_Out_2_Float, half(0), half(1), _Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Split_992c0de0de817484b2d52aeb19e22ee0_R_1_Float = IN.VertexColor[0];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_G_2_Float = IN.VertexColor[1];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_B_3_Float = IN.VertexColor[2];
            half _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            half _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float;
            Unity_Multiply_half_half(_Clamp_1bc51cfc739c4d8b83d3091fe5531af1_Out_3_Float, _Split_992c0de0de817484b2d52aeb19e22ee0_A_4_Float, _Multiply_06c67b054679ab8c8ba6fd612fb6221d_Out_2_Float);
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
            surface.BaseColor = _Lerp_cd0b2060e6116c8383d81eaddc5fce73_Out_3_Vector3;
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