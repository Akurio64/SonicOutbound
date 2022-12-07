//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~





//
//  OLD TV Filter for GameMaker
//
//  Version 1.0
//  
//  Developed by Vortex Game Studios LTDA ME. (http://vortexstudios.com
//  Authos: Alexandre Ribeiro de Sá (@alexribeirodesa)
//

uniform sampler2D t_texChromatic;
uniform float f_magnetudeChromatic;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 o = texture2D( gm_BaseTexture, v_vTexcoord );

    //  chromatic aberration
    if( f_magnetudeChromatic != 0.0 ) {
        vec3 c = texture2D( t_texChromatic, v_vTexcoord ).rgb * f_magnetudeChromatic;

        o.r = texture2D( gm_BaseTexture, v_vTexcoord - c.r ).r;
        o.b = texture2D( gm_BaseTexture, v_vTexcoord + c.b ).b;
    }

    gl_FragColor = o;
}

