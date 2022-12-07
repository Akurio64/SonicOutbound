//
//  OLD TV Filter for GameMaker
//
//  Version 1.0
//  
//  Developed by Vortex Game Studios LTDA ME. (http://vortexstudios.com
//  Authos: Alexandre Ribeiro de Sá (@alexribeirodesa)
//

attribute vec3 in_Position;                  // (x,y,z)
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

uniform sampler2D t_texMask;
uniform float f_magnetudeTube;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec2 radialDistortion(vec2 uv) {
    vec2 cc = uv - 0.5;
    float dt = dot(cc, cc) * f_magnetudeTube;
    dt -= 0.2 * f_magnetudeTube;
    return uv + cc * (1.0 + dt) * dt;
}

void main() {
    vec4 o;
    vec2 uv;
    
    //  get the tube distortion
    if( f_magnetudeTube > 0.0 ) {
        uv = radialDistortion( v_vTexcoord );
        if( uv.x < 0.0025 || uv.x > 0.9975 || uv.y < 0.0025 || uv.y > 0.9975 ) {
            gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        uv = v_vTexcoord;
    }
    
    o = texture2D( gm_BaseTexture, uv );
 
    //  apply the mask
    o.rgb *= texture2D( t_texMask, uv ).rgb;
    gl_FragColor = o;
}

