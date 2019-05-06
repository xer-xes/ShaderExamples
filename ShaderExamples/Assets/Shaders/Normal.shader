Shader "Shader Examples/Normal"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _BumpTex ("Normal Texture", 2D) = "bump" {}
		_BumpSlider("Bump Amount",Range(0,10)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _BumpTex;
		half _BumpSlider;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpTex;
        };
        void surf (Input IN, inout SurfaceOutput o)
        {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
			o.Normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));
			o.Normal *= float3(_BumpSlider, _BumpSlider, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
