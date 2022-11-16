#define buffer_set_surface_fix
/// buffer_set_surface_fix(buffer, surface);
var buff = argument[0];
var surf = argument[1];

var offset = 0;
var h = surface_get_height(surf);
var w = surface_get_width(surf);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
//buffer_seek(buff, buffer_seek_start, 0);

for( var j=0; j < h; j++ )
{
    for( var i=0; i < w; i+=10 )
    {
        var buf32 = buffer_peek(buff, offset, buffer_u32);

        //var r = buf32 & $FF;
        //var g = (buf32 & $FF00) >> 8;
        //var b = (buf32 & $FF0000) >> 16
        
        draw_point_color(i, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        //draw_sprite_ext(sprWebMPixel,0,i,j,1,1,0,make_colour_rgb(r, g, b),1);
        
        buf32 = buffer_peek(buff, offset+4, buffer_u32);
        draw_point_color(i+1, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+8, buffer_u32);
        draw_point_color(i+2, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+12, buffer_u32);
        draw_point_color(i+3, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+16, buffer_u32);
        draw_point_color(i+4, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+20, buffer_u32);
        draw_point_color(i+5, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+24, buffer_u32);
        draw_point_color(i+6, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+28, buffer_u32);
        draw_point_color(i+7, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+32, buffer_u32);
        draw_point_color(i+8, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        buf32 = buffer_peek(buff, offset+36, buffer_u32);
        draw_point_color(i+9, j,make_colour_rgb(buf32 & $FF, (buf32 & $FF00) >> 8, (buf32 & $FF0000) >> 16));
        
        offset +=40
    }
}
surface_reset_target();

draw_set_color(c_white);
draw_set_alpha(1);

#define draw_buffer
var xpos = argument[0];
var ypos = argument[1];
var buff = argument[2];
var height = argument[3];
var width = argument[4];
buffer_seek(buff, buffer_seek_start, 0);

    for( var j=0; j < height; j++ ){
        for( var i=0; i < width; i++ ){
            var b = buffer_read(buff, buffer_u8);
            var g = buffer_read(buff, buffer_u8);
            var r = buffer_read(buff, buffer_u8);
            var a = buffer_read(buff, buffer_u8);
            draw_set_color(make_colour_rgb(r, g, b));
            draw_set_alpha(a);
            draw_point(xpos+i, ypos+j);
        }
    }

draw_set_color(c_white);
draw_set_alpha(1);