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
vec2 size = vec2(8.,16.);
vec2 otherlocation = vec2(100.0, 100.0);

float rand(float seed) {
    // Deterministically produce noise in the range [0, 1].
    // No idea how it's actually distributed but it looks ok.
    return fract(155470.3 * sin(fract(94.3*seed + 10579.6) * fract(76.5*seed + 8437.2)));
}

float rand(vec2 seed) {
    // Turn a pair of floats into a single float in an isotropic, asymmetric way
    //return mix(seed.x, seed.y, seed.x / seed.y);// Good for most areas, except around the axes
    if (seed.y > seed.x)
    return mix(seed.x, seed.y, (seed.x + 50.) / (seed.y + 250.));// Good for most reasonable y
    return mix(seed.x, seed.y, (seed.y + 50.) / (seed.x + 250.));;
}

float smooth1(float x) {
    // Cubic smoothing, same as smoothstep
    return x * x * (3.0 - 2.0 * x);
}

float smooth2(float x) {
    // Ken Perlin's Famous Quintic Smoothing
    return x * x * x * (x * (x * 6.0 - 15.0) + 10.0);
}

void main( void )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    vec2 pos = uv * size;// Position in the grid
    pos.x += iGlobalTime;
    vec2 cell = floor(pos);// Grid cell number
    vec2 offs = fract(pos);// Location in grid cell
    offs.x = smooth2(offs.x);
    offs.y = smooth2(offs.y);
    
    vec2 right = vec2(1.0, 0.0);
    vec2 up = vec2(0.0, 1.0);
    float val1 = mix(rand(rand(cell)), rand(rand(cell + right)), offs.x);
    float val2 = mix(rand(rand(cell + up)), rand(rand(cell + up + right)), offs.x);
    cell += otherlocation;
    float val3 = mix(rand(rand(cell)), rand(rand(cell + right)), offs.x);
    float val4 = mix(rand(rand(cell + up)), rand(rand(cell + up + right)), offs.x);
    //float dy = val2 - val1;
    float valx = mix(val1, val2, offs.y);
    float valy = mix(val3, val4, offs.y);
    //val = smooth2(val);// Makes it look like the whites are clipping, but apparently not
    
    //vec3 col = vec3(valx);
    //vec3 col = vec3(0.0, dy, 0.0);
    //vec2 texoff = vec2(rand(rand(cell)), rand(rand(cell + otherlocation)));
    vec2 texoff = vec2(valx, valy);
    vec3 col = texture2D(gm_BaseTexture, uv + texoff * 0.1).rgb;
    
    // Output to screen
    gl_FragColor = vec4(col,1.0);
}
