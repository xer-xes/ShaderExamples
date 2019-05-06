Shader "Shader Examples/Texture color"
{
	Properties{
		_myTex("Example Texture", 2D) = "white" {}
		_EmissiveTex("Emissive", 2D) = "white" {}
	}
		SubShader{

		  CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myTex;
			sampler2D _EmissiveTex;

			struct Input {
				float2 uv_myTex;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				//float4 green = float4(0, 1, 0, 1);
				o.Albedo = (tex2D(_myTex, IN.uv_myTex)).rgb;
				o.Emission = tex2D(_EmissiveTex, IN.uv_myTex).rgb;
			}

		  ENDCG
	}
		Fallback "Diffuse"
}
