Shader "Unlit/ShaderTest"
{
    Properties
    {
        _MainTexture("Main Texture", 2D) = "white" {} 
        _MainColor("Main Color", Color) = (1, 1, 1, 1) 
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
                float4 position : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 position : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTexture;
            float4 _MainColor;

            v2f vert(appdata IN)
            {
                v2f o;
                o.position = UnityObjectToClipPos(IN.position);
                o.uv = IN.uv;
                return o;
            }

            float4 frag(v2f IN) : SV_TARGET
            {
                float4 color;
                color = tex2D(_MainTexture, IN.uv);
                return color;
            }

            ENDCG
        }


    } 
}
