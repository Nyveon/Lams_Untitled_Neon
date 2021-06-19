//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


void main()
{
	vec4 source = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 gray = vec3( dot( source.rgb , vec3( 0.2126 , 0.7152 , 0.0722 ) ) );
	gl_FragColor = vec4( mix( gray, source.rgb, 0.5), source.a );
}
