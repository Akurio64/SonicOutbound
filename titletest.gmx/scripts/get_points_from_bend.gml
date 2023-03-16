var coords = argument[0];
var len = argument[1];
var points = 0;
var p = 0;

var px1 = 0;
var py1 = 0;
var px2 = 0;
var py2 = 0;
var pxm = 0;
var pym = 0;

for(var i = 0, l = array_height_2d(coords); i < l and l > 1; i += 6) {

    if i == 0 continue;

    px1 = coords[i-1,0];
    py1 = coords[i-1,1];
    px2 = coords[i,0];
    py2 = coords[i,1];
    
    var ds = point_distance(px1, py1, px2, py2) * len;
    var dr = point_direction(px1, py1, px2, py2);
    
    points[p,0] = px1 + lengthdir_x(ds, dr);
    points[p,1] = py1 + lengthdir_y(ds, dr);
    
    
    draw_set_color(c_green);
    draw_circle(points[p,0], points[p,1], 5, false);
    draw_set_color(c_yellow);
    draw_circle(px1, py1, 5, false);
    draw_set_color(c_red);
    draw_circle(px2, py2, 5, false);
    
    p++;
}

return points;

