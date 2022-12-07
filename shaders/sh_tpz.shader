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
void main( void )
{
float time=iGlobalTime*1.0;
vec2 uv = (fragCoord.xy / iResolution.xx-0.5)*8.0;
    vec2 uv0=uv;
float i0=1.0;
float i1=1.0;
float i2=1.0;
float i4=0.0;
for(int s=0;s<7;s++)
{
vec2 r;
r=vec2(cos(uv.y*i0-i4+time/i1),sin(uv.x*i0-i4+time/i1))/i2;
        r+=vec2(-r.y,r.x)*0.3;
uv.xy+=r;
        
i0*=1.93;
i1*=1.15;
i2*=1.7;
i4+=0.05+0.1*time*i1;
}
    float r=sin(uv.x-time)*0.15+0.15;
    float b=sin(uv.y+time)*0.15+0.15;
    float g=sin((uv.x+uv.y+sin(time*0.45))*0.45)*0.5+0.5;
gl_FragColor = vec4(r,g,b,1.0);
}
