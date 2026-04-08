Shader "NatureManufacture Shaders/Debug/Flowmap Direction"
{
    Properties
    {
        [NoScaleOffset]_Direction("Direction", 2D) = "white" {}
        _TextureSize("Texture Size", Vector) = (246, 246, 0, 0)
        [ToggleUI]_RotateUV("Rotate UV", Float) = 1
        [ToggleUI]Boolean_F2B1E91A("Boolean", Float) = 0
        [NonModifiableTextureData][NoScaleOffset]_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D("Texture2D", 2D) = "white" {}
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
            "RenderType"="Opaque"
            "UniversalMaterialType" = "Unlit"
            "Queue"="AlphaTest"
            "DisableBatching"="False"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="UniversalUnlitSubTarget"
        }
        Pass
        {
            Name "Universal Forward"
            Tags
            {
                // LightMode: <None>
            }
        
        // Render State
        Cull Back
        Blend One Zero
        ZTest LEqual
        ZWrite On
        AlphaToMask On
        
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
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ USE_LEGACY_LIGHTMAPS
        #pragma shader_feature _ _SAMPLE_GI
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        // GraphKeywords: <None>
        
        // Defines
        
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD3
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD3
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_UNLIT
        #define _FOG_FRAGMENT 1
        #define _ALPHATEST_ON 1
        
        
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
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv3 : TEXCOORD3;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 texCoord0;
             float4 texCoord3;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float4 uv0;
             float4 uv3;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 texCoord0 : INTERP0;
             float4 texCoord3 : INTERP1;
             float3 positionWS : INTERP2;
             float3 normalWS : INTERP3;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A / B;
        }
        
        void Unity_Fraction_float2(float2 In, out float2 Out)
        {
            Out = frac(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A - B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Arctangent_float(float In, out float Out)
        {
            Out = atan(In);
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Rotate_Radians_float(float2 UV, float2 Center, float Rotation, out float2 Out)
        {
            //rotation matrix
            UV -= Center;
            float s = sin(Rotation);
            float c = cos(Rotation);
        
            //center rotation matrix
            float2x2 rMatrix = float2x2(c, -s, s, c);
            rMatrix *= 0.5;
            rMatrix += 0.5;
            rMatrix = rMatrix*2 - 1;
        
            //multiply the UVs by the rotation matrix
            UV.xy = mul(UV.xy, rMatrix);
            UV += Center;
        
            Out = UV;
        }
        
        void Unity_Distance_float2(float2 A, float2 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
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
            float3 BaseColor;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Direction);
            float4 _UV_7c8a457b34527181924b2b4a71350de9_Out_0_Vector4 = IN.uv0;
            float2 _TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2;
            Unity_TilingAndOffset_float((_UV_7c8a457b34527181924b2b4a71350de9_Out_0_Vector4.xy), float2 (2, 2), float2 (0, 0), _TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2);
            float2 _Vector2_9a3e446bd0dfc3868e3db6f9bf101ead_Out_0_Vector2 = float2(float(1), float(1));
            float2 _Vector2_8355e4dbd796b188ba1e500dcabf0c0f_Out_0_Vector2 = float2(float(30), float(30));
            float2 _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2;
            Unity_Divide_float2(_Vector2_9a3e446bd0dfc3868e3db6f9bf101ead_Out_0_Vector2, _Vector2_8355e4dbd796b188ba1e500dcabf0c0f_Out_0_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2);
            float2 _Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2;
            Unity_Divide_float2(_TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2, _Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2);
            float2 _Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2;
            Unity_Fraction_float2(_Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2, _Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2);
            float2 _Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2, _Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2);
            float2 _Vector2_e6d2595367ed0380b42c7a74855838a5_Out_0_Vector2 = float2(float(246), float(246));
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_Width_0_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.z;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_Height_2_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.w;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_TexelWidth_3_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.x;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_TexelHeight_4_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.y;
            float2 _Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2 = float2(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Width_0_Float, _TexelSize_18bb9f416e386f87bee91aa46804bc56_Height_2_Float);
            float2 _Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_e6d2595367ed0380b42c7a74855838a5_Out_0_Vector2, _Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2, _Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2);
            float2 _Vector2_97c81bcbfd26f08385a101ac3da412f3_Out_0_Vector2 = float2(float(10), float(10));
            float2 _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2, _Vector2_97c81bcbfd26f08385a101ac3da412f3_Out_0_Vector2, _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2);
            float2 _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2;
            Unity_Subtract_float2(_Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2, _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2, _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2);
            float2 _Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2, _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2, _Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2);
            float2 _Vector2_df86361e9c36e7828e3097cc1fa8a75b_Out_0_Vector2 = float2(float(0.1), float(0.1));
            float2 _Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2, _Vector2_df86361e9c36e7828e3097cc1fa8a75b_Out_0_Vector2, _Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2);
            float4 _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4 = IN.uv3;
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[0];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[1];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_B_3_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[2];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_A_4_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[3];
            float _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float;
            Unity_Multiply_float_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float, -1, _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float);
            float _Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean;
            Unity_Comparison_Greater_float(_Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float, float(0), _Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean);
            float _Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float;
            Unity_Divide_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float, _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float, _Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float);
            float _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float;
            Unity_Arctangent_float(_Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float, _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float);
            float _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float;
            Unity_Add_float(_Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float, float(3.141592), _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float);
            float _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float;
            Unity_Branch_float(_Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean, _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float, _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float, _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float);
            float2 _Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2;
            Unity_Rotate_Radians_float(_Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2, float2 (0.5, 0.5), _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float, _Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2);
              float4 _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D_LOD(_Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.tex, _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.samplerstate, _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.GetTransformedUV(_Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2), float(0));
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_R_5_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.r;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_G_6_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.g;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_B_7_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.b;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_A_8_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.a;
            float _Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean;
            Unity_Comparison_Greater_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float, float(0.001), _Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean);
            float3 _Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3 = float3(float(0), float(0), float(0));
            float2 _Vector2_4aeecd1cb271dd8e96c2fb12309b9dd0_Out_0_Vector2 = float2(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float, _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float);
            float _Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float;
            Unity_Distance_float2(_Vector2_4aeecd1cb271dd8e96c2fb12309b9dd0_Out_0_Vector2, float2(0, 0), _Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float);
            float _Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float;
            Unity_Multiply_float_float(_Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float, 1.6, _Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float);
            float _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float;
            Unity_Clamp_float(_Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float, float(0), float(1), _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float);
            float _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float;
            Unity_Subtract_float(float(1), _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float, _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float);
            float3 _Vector3_aeff4a868e81c68f85dfe4c9662da9ce_Out_0_Vector3 = float3(float(1), _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float, float(0));
            float _Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float;
            Unity_Absolute_float(_Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float, _Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float);
            float _Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float;
            Unity_Power_float(_Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float, float(0.16), _Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float);
            float _Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float;
            Unity_Clamp_float(_Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float, float(0), float(1), _Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float);
            float3 _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3, _Vector3_aeff4a868e81c68f85dfe4c9662da9ce_Out_0_Vector3, (_Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float.xxx), _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3);
            float3 _Vector3_484f28086891e98d9589d1f65774f6f4_Out_0_Vector3 = float3(float(0), _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float, float(1));
            float3 _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3, _Vector3_484f28086891e98d9589d1f65774f6f4_Out_0_Vector3, (_Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float.xxx), _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3);
            float3 _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3;
            Unity_Branch_float3(_Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean, _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3, _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3, _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3);
            float3 _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3;
            Unity_Multiply_float3_float3((_SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_A_8_Float.xxx), _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3, _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3);
            surface.BaseColor = _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv3 = input.texCoord3;
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/UnlitPass.hlsl"
        
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
        Cull Back
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
        // PassKeywords: <None>
        // GraphKeywords: <None>
        
        // Defines
        
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define _ALPHATEST_ON 1
        
        
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
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        // GraphFunctions: <None>
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
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
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
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
            Name "MotionVectors"
            Tags
            {
                "LightMode" = "MotionVectors"
            }
        
        // Render State
        Cull Back
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
        // PassKeywords: <None>
        // GraphKeywords: <None>
        
        // Defines
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_MOTION_VECTORS
        #define _ALPHATEST_ON 1
        
        
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
             float3 positionOS : POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        // GraphFunctions: <None>
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
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
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
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
            Name "DepthNormalsOnly"
            Tags
            {
                "LightMode" = "DepthNormalsOnly"
            }
        
        // Render State
        Cull Back
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
        #pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
        // GraphKeywords: <None>
        
        // Defines
        
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #define VARYINGS_NEED_NORMAL_WS
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
        #define _ALPHATEST_ON 1
        
        
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
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float3 normalWS : INTERP0;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        // GraphFunctions: <None>
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
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
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
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
            Name "ShadowCaster"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }
        
        // Render State
        Cull Back
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
        // GraphKeywords: <None>
        
        // Defines
        
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #define VARYINGS_NEED_NORMAL_WS
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_SHADOWCASTER
        #define _ALPHATEST_ON 1
        
        
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
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float3 normalWS : INTERP0;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        // GraphFunctions: <None>
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
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
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
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
            Name "GBuffer"
            Tags
            {
                "LightMode" = "UniversalGBuffer"
            }
        
        // Render State
        Cull Back
        Blend One Zero
        ZTest LEqual
        ZWrite On
        
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
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        // GraphKeywords: <None>
        
        // Defines
        
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD3
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD3
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_GBUFFER
        #define _ALPHATEST_ON 1
        
        
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
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv3 : TEXCOORD3;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 texCoord0;
             float4 texCoord3;
            #if !defined(LIGHTMAP_ON)
             float3 sh;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float4 uv0;
             float4 uv3;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if !defined(LIGHTMAP_ON)
             float3 sh : INTERP0;
            #endif
             float4 texCoord0 : INTERP1;
             float4 texCoord3 : INTERP2;
             float3 positionWS : INTERP3;
             float3 normalWS : INTERP4;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
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
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord3 = input.texCoord3.xyzw;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A / B;
        }
        
        void Unity_Fraction_float2(float2 In, out float2 Out)
        {
            Out = frac(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A - B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Arctangent_float(float In, out float Out)
        {
            Out = atan(In);
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Rotate_Radians_float(float2 UV, float2 Center, float Rotation, out float2 Out)
        {
            //rotation matrix
            UV -= Center;
            float s = sin(Rotation);
            float c = cos(Rotation);
        
            //center rotation matrix
            float2x2 rMatrix = float2x2(c, -s, s, c);
            rMatrix *= 0.5;
            rMatrix += 0.5;
            rMatrix = rMatrix*2 - 1;
        
            //multiply the UVs by the rotation matrix
            UV.xy = mul(UV.xy, rMatrix);
            UV += Center;
        
            Out = UV;
        }
        
        void Unity_Distance_float2(float2 A, float2 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
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
            float3 BaseColor;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Direction);
            float4 _UV_7c8a457b34527181924b2b4a71350de9_Out_0_Vector4 = IN.uv0;
            float2 _TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2;
            Unity_TilingAndOffset_float((_UV_7c8a457b34527181924b2b4a71350de9_Out_0_Vector4.xy), float2 (2, 2), float2 (0, 0), _TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2);
            float2 _Vector2_9a3e446bd0dfc3868e3db6f9bf101ead_Out_0_Vector2 = float2(float(1), float(1));
            float2 _Vector2_8355e4dbd796b188ba1e500dcabf0c0f_Out_0_Vector2 = float2(float(30), float(30));
            float2 _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2;
            Unity_Divide_float2(_Vector2_9a3e446bd0dfc3868e3db6f9bf101ead_Out_0_Vector2, _Vector2_8355e4dbd796b188ba1e500dcabf0c0f_Out_0_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2);
            float2 _Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2;
            Unity_Divide_float2(_TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2, _Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2);
            float2 _Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2;
            Unity_Fraction_float2(_Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2, _Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2);
            float2 _Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2, _Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2);
            float2 _Vector2_e6d2595367ed0380b42c7a74855838a5_Out_0_Vector2 = float2(float(246), float(246));
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_Width_0_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.z;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_Height_2_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.w;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_TexelWidth_3_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.x;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_TexelHeight_4_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.y;
            float2 _Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2 = float2(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Width_0_Float, _TexelSize_18bb9f416e386f87bee91aa46804bc56_Height_2_Float);
            float2 _Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_e6d2595367ed0380b42c7a74855838a5_Out_0_Vector2, _Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2, _Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2);
            float2 _Vector2_97c81bcbfd26f08385a101ac3da412f3_Out_0_Vector2 = float2(float(10), float(10));
            float2 _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2, _Vector2_97c81bcbfd26f08385a101ac3da412f3_Out_0_Vector2, _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2);
            float2 _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2;
            Unity_Subtract_float2(_Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2, _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2, _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2);
            float2 _Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2, _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2, _Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2);
            float2 _Vector2_df86361e9c36e7828e3097cc1fa8a75b_Out_0_Vector2 = float2(float(0.1), float(0.1));
            float2 _Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2, _Vector2_df86361e9c36e7828e3097cc1fa8a75b_Out_0_Vector2, _Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2);
            float4 _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4 = IN.uv3;
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[0];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[1];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_B_3_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[2];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_A_4_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[3];
            float _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float;
            Unity_Multiply_float_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float, -1, _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float);
            float _Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean;
            Unity_Comparison_Greater_float(_Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float, float(0), _Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean);
            float _Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float;
            Unity_Divide_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float, _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float, _Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float);
            float _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float;
            Unity_Arctangent_float(_Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float, _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float);
            float _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float;
            Unity_Add_float(_Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float, float(3.141592), _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float);
            float _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float;
            Unity_Branch_float(_Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean, _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float, _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float, _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float);
            float2 _Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2;
            Unity_Rotate_Radians_float(_Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2, float2 (0.5, 0.5), _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float, _Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2);
              float4 _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D_LOD(_Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.tex, _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.samplerstate, _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.GetTransformedUV(_Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2), float(0));
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_R_5_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.r;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_G_6_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.g;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_B_7_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.b;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_A_8_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.a;
            float _Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean;
            Unity_Comparison_Greater_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float, float(0.001), _Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean);
            float3 _Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3 = float3(float(0), float(0), float(0));
            float2 _Vector2_4aeecd1cb271dd8e96c2fb12309b9dd0_Out_0_Vector2 = float2(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float, _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float);
            float _Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float;
            Unity_Distance_float2(_Vector2_4aeecd1cb271dd8e96c2fb12309b9dd0_Out_0_Vector2, float2(0, 0), _Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float);
            float _Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float;
            Unity_Multiply_float_float(_Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float, 1.6, _Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float);
            float _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float;
            Unity_Clamp_float(_Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float, float(0), float(1), _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float);
            float _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float;
            Unity_Subtract_float(float(1), _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float, _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float);
            float3 _Vector3_aeff4a868e81c68f85dfe4c9662da9ce_Out_0_Vector3 = float3(float(1), _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float, float(0));
            float _Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float;
            Unity_Absolute_float(_Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float, _Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float);
            float _Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float;
            Unity_Power_float(_Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float, float(0.16), _Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float);
            float _Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float;
            Unity_Clamp_float(_Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float, float(0), float(1), _Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float);
            float3 _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3, _Vector3_aeff4a868e81c68f85dfe4c9662da9ce_Out_0_Vector3, (_Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float.xxx), _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3);
            float3 _Vector3_484f28086891e98d9589d1f65774f6f4_Out_0_Vector3 = float3(float(0), _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float, float(1));
            float3 _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3, _Vector3_484f28086891e98d9589d1f65774f6f4_Out_0_Vector3, (_Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float.xxx), _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3);
            float3 _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3;
            Unity_Branch_float3(_Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean, _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3, _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3, _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3);
            float3 _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3;
            Unity_Multiply_float3_float3((_SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_A_8_Float.xxx), _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3, _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3);
            surface.BaseColor = _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv3 = input.texCoord3;
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/UnlitGBufferPass.hlsl"
        
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
        // PassKeywords: <None>
        // GraphKeywords: <None>
        
        // Defines
        
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENESELECTIONPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        #define _ALPHATEST_ON 1
        
        
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
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        // GraphFunctions: <None>
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
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
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
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
        Cull Back
        
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
        // PassKeywords: <None>
        // GraphKeywords: <None>
        
        // Defines
        
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD3
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD3
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENEPICKINGPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        #define _ALPHATEST_ON 1
        
        
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
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv3 : TEXCOORD3;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float4 texCoord0;
             float4 texCoord3;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float4 uv0;
             float4 uv3;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 texCoord0 : INTERP0;
             float4 texCoord3 : INTERP1;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord3.xyzw = input.texCoord3;
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
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float4 _TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D_TexelSize;
        float4 _Direction_TexelSize;
        float2 _TextureSize;
        float _RotateUV;
        float Boolean_F2B1E91A;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        TEXTURE2D(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        SAMPLER(sampler_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D);
        TEXTURE2D(_Direction);
        SAMPLER(sampler_Direction);
        
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
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A / B;
        }
        
        void Unity_Fraction_float2(float2 In, out float2 Out)
        {
            Out = frac(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A - B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Arctangent_float(float In, out float Out)
        {
            Out = atan(In);
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Rotate_Radians_float(float2 UV, float2 Center, float Rotation, out float2 Out)
        {
            //rotation matrix
            UV -= Center;
            float s = sin(Rotation);
            float c = cos(Rotation);
        
            //center rotation matrix
            float2x2 rMatrix = float2x2(c, -s, s, c);
            rMatrix *= 0.5;
            rMatrix += 0.5;
            rMatrix = rMatrix*2 - 1;
        
            //multiply the UVs by the rotation matrix
            UV.xy = mul(UV.xy, rMatrix);
            UV += Center;
        
            Out = UV;
        }
        
        void Unity_Distance_float2(float2 A, float2 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
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
            float3 BaseColor;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Direction);
            float4 _UV_7c8a457b34527181924b2b4a71350de9_Out_0_Vector4 = IN.uv0;
            float2 _TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2;
            Unity_TilingAndOffset_float((_UV_7c8a457b34527181924b2b4a71350de9_Out_0_Vector4.xy), float2 (2, 2), float2 (0, 0), _TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2);
            float2 _Vector2_9a3e446bd0dfc3868e3db6f9bf101ead_Out_0_Vector2 = float2(float(1), float(1));
            float2 _Vector2_8355e4dbd796b188ba1e500dcabf0c0f_Out_0_Vector2 = float2(float(30), float(30));
            float2 _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2;
            Unity_Divide_float2(_Vector2_9a3e446bd0dfc3868e3db6f9bf101ead_Out_0_Vector2, _Vector2_8355e4dbd796b188ba1e500dcabf0c0f_Out_0_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2);
            float2 _Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2;
            Unity_Divide_float2(_TilingAndOffset_67d58b7a8092828aaece7f3acfe6e8a9_Out_3_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2, _Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2);
            float2 _Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2;
            Unity_Fraction_float2(_Divide_5d0f49ab4bcab689894f976217114a79_Out_2_Vector2, _Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2);
            float2 _Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Fraction_e4f0f05fb76fd3809f5ec855b54a4595_Out_1_Vector2, _Divide_f0d0aaa28637b781bcd99c1c912b5eae_Out_2_Vector2, _Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2);
            float2 _Vector2_e6d2595367ed0380b42c7a74855838a5_Out_0_Vector2 = float2(float(246), float(246));
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_Width_0_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.z;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_Height_2_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.w;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_TexelWidth_3_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.x;
            float _TexelSize_18bb9f416e386f87bee91aa46804bc56_TexelHeight_4_Float = UnityBuildTexture2DStructNoScale(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Texture_1_Texture2D).texelSize.y;
            float2 _Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2 = float2(_TexelSize_18bb9f416e386f87bee91aa46804bc56_Width_0_Float, _TexelSize_18bb9f416e386f87bee91aa46804bc56_Height_2_Float);
            float2 _Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_e6d2595367ed0380b42c7a74855838a5_Out_0_Vector2, _Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2, _Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2);
            float2 _Vector2_97c81bcbfd26f08385a101ac3da412f3_Out_0_Vector2 = float2(float(10), float(10));
            float2 _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_e8728bfbf194e5818f010927b4ba8d79_Out_0_Vector2, _Vector2_97c81bcbfd26f08385a101ac3da412f3_Out_0_Vector2, _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2);
            float2 _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2;
            Unity_Subtract_float2(_Multiply_561a2890964f4081a8cf5d16bccb889f_Out_2_Vector2, _Multiply_bccda05b3809138d8da15484dd6a7b4e_Out_2_Vector2, _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2);
            float2 _Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Multiply_cbcb0de832b1d08288916e46aa8d4df2_Out_2_Vector2, _Subtract_710d4672e66f7780ad90ca6e19a733bd_Out_2_Vector2, _Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2);
            float2 _Vector2_df86361e9c36e7828e3097cc1fa8a75b_Out_0_Vector2 = float2(float(0.1), float(0.1));
            float2 _Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Multiply_cd542324eceadd8daaca18ab78d3fbf6_Out_2_Vector2, _Vector2_df86361e9c36e7828e3097cc1fa8a75b_Out_0_Vector2, _Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2);
            float4 _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4 = IN.uv3;
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[0];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[1];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_B_3_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[2];
            float _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_A_4_Float = _UV_1ca38e193be034888b8a707af9d47210_Out_0_Vector4[3];
            float _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float;
            Unity_Multiply_float_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float, -1, _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float);
            float _Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean;
            Unity_Comparison_Greater_float(_Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float, float(0), _Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean);
            float _Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float;
            Unity_Divide_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float, _Multiply_3bdf02c598430c878e3738cac7f0dae8_Out_2_Float, _Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float);
            float _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float;
            Unity_Arctangent_float(_Divide_2b884a92fd783d82a9012917c2b83115_Out_2_Float, _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float);
            float _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float;
            Unity_Add_float(_Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float, float(3.141592), _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float);
            float _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float;
            Unity_Branch_float(_Comparison_e67d9847aa86858490dd0c37e68e7505_Out_2_Boolean, _Arctangent_5140ab7fbdf95a8f9329bfd0cd09226c_Out_1_Float, _Add_cf6b7aee4a487f8ca16b9171b64a8f0d_Out_2_Float, _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float);
            float2 _Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2;
            Unity_Rotate_Radians_float(_Multiply_8e351d40d36634829f2bb0905b9b9342_Out_2_Vector2, float2 (0.5, 0.5), _Branch_9de100b31215ba89bb19e5b89012a25a_Out_3_Float, _Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2);
              float4 _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4 = SAMPLE_TEXTURE2D_LOD(_Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.tex, _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.samplerstate, _Property_70a6ddd048a60f81b46e2042f9ae833b_Out_0_Texture2D.GetTransformedUV(_Rotate_ff1406ef744b188ca79c6d3bf0b8bbd7_Out_3_Vector2), float(0));
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_R_5_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.r;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_G_6_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.g;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_B_7_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.b;
            float _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_A_8_Float = _SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_RGBA_0_Vector4.a;
            float _Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean;
            Unity_Comparison_Greater_float(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float, float(0.001), _Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean);
            float3 _Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3 = float3(float(0), float(0), float(0));
            float2 _Vector2_4aeecd1cb271dd8e96c2fb12309b9dd0_Out_0_Vector2 = float2(_Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_R_1_Float, _Split_11d6e1d03b6aec85a5cc295d4f2f2c3a_G_2_Float);
            float _Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float;
            Unity_Distance_float2(_Vector2_4aeecd1cb271dd8e96c2fb12309b9dd0_Out_0_Vector2, float2(0, 0), _Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float);
            float _Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float;
            Unity_Multiply_float_float(_Distance_47e812ff6269a181b6e0faa017faee3b_Out_2_Float, 1.6, _Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float);
            float _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float;
            Unity_Clamp_float(_Multiply_e5102f48c5e759879293e06062894e0c_Out_2_Float, float(0), float(1), _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float);
            float _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float;
            Unity_Subtract_float(float(1), _Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float, _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float);
            float3 _Vector3_aeff4a868e81c68f85dfe4c9662da9ce_Out_0_Vector3 = float3(float(1), _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float, float(0));
            float _Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float;
            Unity_Absolute_float(_Clamp_ec36a3c091f7148e8b7ca54cb1273530_Out_3_Float, _Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float);
            float _Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float;
            Unity_Power_float(_Absolute_5573b6b2c1616e819aa4eeb67caec457_Out_1_Float, float(0.16), _Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float);
            float _Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float;
            Unity_Clamp_float(_Power_33dedbf009cacf848c403a58667a66c6_Out_2_Float, float(0), float(1), _Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float);
            float3 _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3, _Vector3_aeff4a868e81c68f85dfe4c9662da9ce_Out_0_Vector3, (_Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float.xxx), _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3);
            float3 _Vector3_484f28086891e98d9589d1f65774f6f4_Out_0_Vector3 = float3(float(0), _Subtract_2f8c058d66260b84866bd56a0469ea11_Out_2_Float, float(1));
            float3 _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_37ab63b41d52bb8d8eba9088ed71bc11_Out_0_Vector3, _Vector3_484f28086891e98d9589d1f65774f6f4_Out_0_Vector3, (_Clamp_062fed397e52b48f8a7809d95fc105e8_Out_3_Float.xxx), _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3);
            float3 _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3;
            Unity_Branch_float3(_Comparison_1a93f0ca7c913a8f81659b20b8d59f2b_Out_2_Boolean, _Lerp_e6000a54e83a8f8e8c5bc16419b360ca_Out_3_Vector3, _Lerp_93469a90f98ccf80a7121c0b2bf05f48_Out_3_Vector3, _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3);
            float3 _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3;
            Unity_Multiply_float3_float3((_SampleTexture2DLOD_7fdbdd0c5b377086acfc5974a225b0dd_A_8_Float.xxx), _Branch_365bf259ae64c386a18e2d6997727100_Out_3_Vector3, _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3);
            surface.BaseColor = _Multiply_0563147e8bc9868b8c2a4f2c442c349f_Out_2_Vector3;
            surface.Alpha = float(1);
            surface.AlphaClipThreshold = float(0.5);
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
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
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
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv3 = input.texCoord3;
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
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
    }
    CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
    CustomEditorForRenderPipeline "UnityEditor.ShaderGraphUnlitGUI" "UnityEngine.Rendering.Universal.UniversalRenderPipelineAsset"
    FallBack "Hidden/Shader Graph/FallbackError"
}