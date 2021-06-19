//Glow map shader (GLSL ES)
//by xygthop3

attribute vec4 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    v_texcoord = in_TextureCoord;
}
