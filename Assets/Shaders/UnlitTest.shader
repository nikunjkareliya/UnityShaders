Shader "Unlit/UnlitTest2"
{

    Properties
    {
        _MainTex("Main Texture", 2D) = "white" { }
        _MainColor ("Color", Color) = (1, 1, 1, 1)        
        _ExtrudeAmount("Extrude Amount", Range(-0.1, 0.1)) = 0
    }

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float4 normal : NORMAL;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainColor;
            float _ExtrudeAmount;

            v2f vert(appdata IN)
            {
                v2f o;

                IN.vertex.xyz += IN.normal.xyz * _ExtrudeAmount;

                o.vertex = UnityObjectToClipPos(IN.vertex);
                o.uv = IN.uv;
                return o;
            }

            float4 frag(v2f IN) : SV_TARGET
            {
                float4 color;
                color = tex2D(_MainTex, IN.uv);  
                color *= _MainColor;
                //color = lerp(_MainColor, (0, 1, 0, 1), );              
                return color;
            }

            ENDCG
        }
    }
}















// Shader "Unlit/UnlitTest2"
// {

//     Properties
//     {
//         _MainTex ("Main Texture", 2D) = "white" { }
//         _MainColor ("Main Color", Color) = (1, 1, 1, 1)
//     }

//     SubShader
//     {

//         Pass 
//         {
//             CGPROGRAM
//             #pragma vertex vert
//             #pragma fragment frag

//             #include "UnityCG.cginc"

//             struct appdata
//             {
//                 float4 position : POSITION;
//                 float2 uv : TEXCOORD0;
//             };

//             struct v2f
//             {
//                 float4 position : SV_POSITION;
//                 float2 uv : TEXCOORD0;
//             };

//             sampler2D _MainTex;
//             fixed4 _MainColor;
//             v2f vert(appdata IN)
//             {
//                 v2f o;
//                 o.position = UnityObjectToClipPos(IN.position);
//                 o.uv = IN.uv;
//                 return o;
//             }

//             float4 frag(v2f IN) : SV_TARGET
//             {
//                 float4 color = tex2D(_MainTex, IN.uv);
//                 color.rgb *= _MainColor.rgb; 
//                 return color;
//             }

//             ENDCG
//         }
//     }

// }







// Shader "Unlit/UnlitTest"
// {
//     Properties
//     {
//         _MainTex ("Texture", 2D) = "white" {}
//         _MainColor ("Color", Color) = (1, 1, 1, 1)
//         _DissolveTexture("Dissolve Texture", 2D) = "white" {}
//         _DissolveAmount("Dissolve Amount", float) = 1
//         _ExtrudeAmount("Extrude Amount", Range(-0.05, 0.05)) = 0
//     }

//     SubShader
//     {
//         Pass
//         {
//             CGPROGRAM
//             #pragma vertex vert  
//             #pragma fragment frag         

//             #include "UnityCG.cginc"

//             struct appdata
//             {
//                 float4 vertex : POSITION;
//                 float2 uv : TEXCOORD0;
//                 float3 normal : NORMAL;
//             };

//             struct v2f
//             {
//                 float2 uv : TEXCOORD0;                
//                 float4 vertex : SV_POSITION;
//             };

//             sampler2D _MainTex;
//             float4 _MainColor;
//             sampler2D _DissolveTexture;
//             float _DissolveAmount;
//             float _ExtrudeAmount;
//             //float4 _MainTex_ST;
//             v2f vert (appdata IN)
//             {
//                 v2f o;

//                 IN.vertex.xyz += IN.normal.xyz * _ExtrudeAmount;

//                 o.vertex = UnityObjectToClipPos(IN.vertex);            
//                 //o.uv = TRANSFORM_TEX(IN.uv, _MainTex);
//                 o.uv = IN.uv;
//                 return o;
//             }

//             fixed4 frag (v2f i) : SV_TARGET
//             {
//                 // sample the texture
//                 fixed4 col = tex2D(_MainTex, i.uv);                
//                 return col * _MainColor;                
//             }

//             ENDCG
//         }
//     }
// }
















































// Shader "Unlit/UnlitTest"
// {
//     Properties
//     {
//         _MainTex ("Texture", 2D) = "white" {}
//     }
//     SubShader
//     {
//         Tags { "RenderType"="Opaque" }
//         LOD 100

//         Pass
//         {
//             CGPROGRAM
//             #pragma vertex vert
//             #pragma fragment frag
//             // make fog work
//             #pragma multi_compile_fog

//             #include "UnityCG.cginc"

//             struct appdata
//             {
//                 float4 vertex : POSITION;
//                 float2 uv : TEXCOORD0;
//             };

//             struct v2f
//             {
//                 float2 uv : TEXCOORD0;
//                 UNITY_FOG_COORDS(1)
//                 float4 vertex : SV_POSITION;
//             };

//             sampler2D _MainTex;
//             float4 _MainTex_ST;

//             v2f vert (appdata v)
//             {
//                 v2f o;
//                 o.vertex = UnityObjectToClipPos(v.vertex);
//                 o.uv = TRANSFORM_TEX(v.uv, _MainTex);
//                 UNITY_TRANSFER_FOG(o,o.vertex);
//                 return o;
//             }

//             fixed4 frag (v2f i) : SV_Target
//             {
//                 // sample the texture
//                 fixed4 col = tex2D(_MainTex, i.uv);
//                 // apply fog
//                 UNITY_APPLY_FOG(i.fogCoord, col);
//                 return col;
//             }
//             ENDCG
//         }
//     }
// }
