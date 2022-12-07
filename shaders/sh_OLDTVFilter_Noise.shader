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
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
//  OLD TV Filter for GameMaker
//
//  Version 1.0
//  
//  Developed by Vortex Game Studios LTDA ME. (http://vortexstudios.com
//  Authos: Alexandre Ribeiro de SÃ¡ (@alexribeirodesa)
//

uniform sampler2D t_texNoise;
uniform float f_magnetudeNoise;
uniform float f_offsetNoise;
uniform sampler2D t_texStatic;
uniform float f_magnetudeStatic;
uniform float f_scaleStatic;
uniform float f_offsetStatic;
uniform sampler2D t_texDirt;
uniform float f_magnetudeDirt;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float RGB2Y(vec3 _rgb) {
    return dot(_rgb, vec3(0.29900, 0.58700, 0.11400));
}

void main()
{
    vec2 offset = vec2(sin(f_offsetNoise), cos(f_offsetNoise));
    
    float staticOffset = 0.0;
    float staticMask = texture2D( t_texStatic, v_vTexcoord + vec2(offset.x, 0.0) ).g;
    
    if( f_magnetudeStatic > 0.0 ) {
        staticOffset = (RGB2Y(texture2D( t_texNoise, vec2(offset.x, v_vTexcoord.y) ).rgb)-0.5)*2.0*staticMask*f_magnetudeStatic;
    }
    
    vec4 o = texture2D( gm_BaseTexture, v_vTexcoord + vec2(staticOffset, 0.0) );
    vec3 noise = texture2D( t_texNoise, v_vTexcoord + vec2(offset.x + staticOffset, offset.y) ).rgb;

    if( f_magnetudeNoise > 0.0 )
        o.rgb = mix( o.rgb, noise, f_magnetudeNoise );
    else if( f_magnetudeNoise < 0.0 )
        o.rgb = mix( o.rgb, o.rgb*noise, -f_magnetudeNoise );

    if( f_magnetudeDirt > 0.0 ) {
        vec3 dirt = texture2D( t_texDirt, v_vTexcoord + vec2(offset.y, 0.0) ).rgb*10.0*staticMask*f_magnetudeDirt;
        dirt.r = clamp(dirt.r, 0.0, 1.0);
        dirt.g = clamp(dirt.g, 0.0, 1.0);
        dirt.b = clamp(dirt.b, 0.0, 1.0);
        
        o.rgb = o.rgb*(vec3(1.0,1.0,1.0)-dirt)+dirt;
    }
    
    gl_FragColor = o;
}

