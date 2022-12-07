attribute vec3 in_Position; 
varying vec2 fragCoord; 
 void main() 
 {
    vec4 Position = vec4( in_Position, 1); 
   gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * Position; 
   fragCoord = in_Position.xy; 
 }
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float iGlobalTime; 
uniform vec3 iResolution; 
varying vec2 fragCoord; 
/*
An old-school RGB plasma, built from several layers of sine functions
Basically a straight port from my highly optimished C plasma code from way back (1996) to a shader,
without any shader specific optimisations. There's probably a lot of redundant stuff in here, and other
things that could be optimised out like doing the fadeFix without branching etc.

Feel free to optimise and let me know how you get on!

License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

-- Fragvarken
*/

float stab1( float angleParam )// input: angle in radians, output: new angle
{
return ( (cos( mod(angleParam,6.28318) ) + 1.0) / 2.0) * 2.0 * 3.14159;
}

float stab2( float angleParam )// input: angle in radians, output: new angle [0..2*PI]
{
return ((sin( mod(angleParam,6.28318) ) + 1.0) / 2.0) * 2.0 * 3.14159;
}

float fadeFix( float angleParam )
{
if( angleParam > (2.0 * 3.14159) )
{
angleParam = (2.0 * 3.14159) - (angleParam - 2.0 * 3.14159);
}

return clamp( angleParam / (2.0 * 3.14159), 0.0, 1.0 );
}


vec2 rotate( in vec2 vector, in float angleRad)
{
float cs = cos(angleRad);
float sn = sin(angleRad);

    vec2 result;
result.x = vector.x * cs - vector.y * sn;
result.y = vector.x * sn + vector.y * cs;
    
    return result;
}


void main( void ) 
{
// texture2D variables
float redAngle = mod(iGlobalTime*0.5,6.28318);
float greenAngle = mod(iGlobalTime*0.4,6.28318);
float blueAngle = mod(iGlobalTime*0.3,6.28318);

float redMult = (sin(iGlobalTime*0.2) + 1.0) / 2.0;;
float greenMult = (sin((iGlobalTime+3.0)*0.29) + 1.0) / 2.0;;
float blueMult = (sin((iGlobalTime+1.5)*0.4) + 1.0) / 2.0;;

vec3 color;

vec2 uv = fragCoord.xy / iResolution.xy;
    
    uv = rotate(uv, iGlobalTime * 0.15 + sin(uv.x*6.28318)*sin(iGlobalTime*0.3)*0.25 + sin(uv.y*6.28318)*sin(iGlobalTime*0.2)*0.25);

float y = ((uv.y / 0.0025) / 360.0) * 3.14159;
float x = ((uv.x / 0.0015) / 360.0) * 3.14159;

// red
float m_ri2 = stab1( redAngle*2.0 + y );
float m_rj2 = stab2( stab2( redAngle + 0.0 ) + y );  
float inner = stab2( m_ri2 + x ) + m_rj2;//[0..4*PI]
color.r = fadeFix( inner ) * redMult;

// green
m_ri2 = stab1( greenAngle*3.0 + y );
m_rj2 = stab2( stab2( greenAngle + 0.8 ) + y );  
inner = stab2( m_ri2 + x ) + m_rj2;//[0..4*PI]
color.g = fadeFix( inner ) * greenMult;

// blue
m_ri2 = stab1( blueAngle*4.0 + y );
m_rj2 = stab2( stab2( blueAngle + 1.9 ) + y );  
inner = stab2( m_ri2 + x ) + m_rj2;//[0..4*PI]
color.b = fadeFix( inner ) * blueMult;

vec3 finalcolor = color;

gl_FragColor = vec4( finalcolor , 1.0 );
}
