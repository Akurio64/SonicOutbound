
    attribute vec3 in_Position; 
    attribute vec2 in_TextureCoord;
    varying vec2 v_vTexcoord;
    void main() {
        gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
        v_vTexcoord = in_TextureCoord;
    }

//######################_==_YOYO_SHADER_MARKER_==_######################@~
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;
    uniform vec4 tex_transform;
    uniform sampler2D tex_back;
    
    vec2 distort(vec2 T) {
        vec2 B = T - 0.5;
        float d = min( 0.25, dot( B,B ) );
        return T + B.xy * ( 0.2 - 0.05 / d );   
    }    
    
    vec2 surf_coords( vec2 T) { return ( T * tex_transform.xy + tex_transform.zw ); }
    
    void main() {
        vec3 mask = texture2D( gm_BaseTexture, v_vTexcoord ).rgb; //sprite colour
        gl_FragColor = vec4( texture2D( tex_back, surf_coords( distort( v_vTexcoord ) ) ).rgb * mask, 1.0 );
    }
