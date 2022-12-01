var vf = argument[0];
var spr = argument[1];
var img = argument[2];
var _x = argument[3]; 
var _y = argument[4];
var around_x = argument[5]; 
var around_y = argument[6]; 
var bend_angle = argument[7];
var segments = argument[8]; 
var xscale = argument[9];
var yscale = argument[10]; 
var rot = argument[11];
var color = argument[12]; 
var alpha = argument[13];

var spr_w = sprite_get_width(spr);
var spr_h = sprite_get_height(spr);
var xoff = sprite_get_xoffset(spr) * xscale;
var yoff = sprite_get_yoffset(spr) * yscale;

var prec = max(2, round(segments));
var step = spr_h / prec;
var angle_step = bend_angle / prec;

// split the sprite into triangles with UVs

var uv = 0;
var uvi = 0;
var c_len = 0;

uv[uvi,0] = 1;
uv[uvi,1] = 0;
uvi++;

var on_right = false;
for(var h = 0; h < spr_h + step * 0.5; h += step) {

    uv[uvi,0] = real(on_right);
    uv[uvi,1] = h/spr_h;
    uvi++;
    on_right = !on_right;
}

uv[uvi,0] = real(on_right);
uv[uvi,1] = 1;
uvi++;

// rotate the triangles around pivot and save their coordinates

var counter = 0;
var angl = 0;
var coords = 0;
var c_len = 0;

for(var i = array_height_2d(uv)-1; i > -1; i--) {

    var u = uv[i,0];
    var v = uv[i,1];
    
    var pivot_x = (around_x - (_x - xoff)) / xscale;
    var pivot_y = (around_y - (_y - yoff)) / yscale;
    
    var pdr = point_direction(pivot_x, pivot_y, u * spr_w, v * spr_h);
    var pds = point_distance(pivot_x, pivot_y, u * spr_w, v * spr_h);
    var xx = pivot_x + lengthdir_x(pds, pdr + angl);
    var yy = pivot_y + lengthdir_y(pds, pdr + angl);
    
    coords[c_len,0] = xx * yscale;
    coords[c_len,1] = yy * yscale;
    coords[c_len,2] = counter == 1;
    coords[c_len,3] = u;
    coords[c_len,4] = v;
    c_len++;
    
    if counter == 2 {
        counter = 0;
     if i == 0 break;
        i += 2;
        angl += angle_step;
  }
  else counter++;
}

// draw it

var pts = 0;

var b = vertex_create_buffer();
vertex_begin(b, vf);

for(var i = 0, l = array_height_2d(coords); i < l; i++) {

    if i == clamp(i, 2, l-3) {
     
        if coords[i-2,2] {
            coords[i,0] = coords[i-2,0];
            coords[i,1] = coords[i-2,1];
            coords[i,2] = false;
        }
        if coords[i+2,2] {
            coords[i,0] = coords[i+2,0];
            coords[i,1] = coords[i+2,1];
            coords[i,2] = false;
        }
    }

    var xx = coords[i,0] - xoff;
    var yy = coords[i,1] - yoff;

    if rot != 0 {
        var pdr = point_direction(0, 0, xx, yy);
        var pds = point_distance(0, 0, xx, yy);
        xx = lengthdir_x(pds, pdr + rot);
        yy = lengthdir_y(pds, pdr + rot);
   }

    vertex_position(b, _x + xx, _y + yy);
    vertex_colour(b, color, alpha);
    vertex_texcoord(b, coords[i,3], coords[i,4]);
    
    pts[i,0] = _x + xx;
    pts[i,1] = _y + yy;
}

vertex_end(b);
vertex_submit(b, pr_trianglelist, sprite_get_texture(spr, img));

return pts;

