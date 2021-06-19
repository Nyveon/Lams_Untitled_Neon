//Glow map shader (GLSL ES)
//by xygthop3

varying vec2 v_texcoord;

uniform sampler2D s_glow_surface;
uniform float u_glow_blur_sigma;
uniform vec2 u_glow_resolution;

const float two_pi = 6.28318530718;
const int size = 16;

float gauss(float sigma, float x, float y)
{
    float sigma2 = sigma * sigma;
   float pwr = -((x * x) + (y * y)) / (2.0 * sigma2);
    return (exp(pwr) / (two_pi * sigma2));
}

float total_weight(float sigma)
{
    float sum = 0.0;
    for(int i = 0; i < size; i++)
        for(int j = 0; j < size; j++)
            sum += gauss(sigma, float(i), float(j));
    return sum;
}

void main() {
    vec4 dst = texture2D(gm_BaseTexture, v_texcoord);

    vec2 stepSize = vec2(1.0) / u_glow_resolution; 
    float sigma = u_glow_blur_sigma;
    vec4 src = vec4(0.0);
    float k = total_weight(sigma);
    
    for(int i = -size / 2; i <= size / 2; i++)
    {
        for(int j = -size / 2; j <= size / 2; j++)
        {
            vec2 coord = v_texcoord + vec2(i, -j) * stepSize;
            float weight = gauss(sigma, float(i), float(j)) / k;
            src += texture2D(s_glow_surface, coord) * weight;
        }
    }

    //Screen blending
    vec3 blendcolor = clamp((src.rgb + dst.rgb) - (src.rgb * dst.rgb), 0.0, 1.0);
    
    gl_FragColor = vec4(blendcolor, dst.a);
}
