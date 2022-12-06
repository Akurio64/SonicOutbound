///instance_point_nearest(x,y,[radius])

var _x = argument0;
var _y = argument1;
var calculate;
var r;
var _r
var _x1, _y1, _x2, _y2, _x3, _y3, _d;


if(argument_count > 2)
{
    _r = argument2;
}
else
    _r = false;

var _c = dcos(image_angle);
var _s = dsin(image_angle);

_x1 = _x * _c + _y * -_s + ( - x * _c - y * -_s );
_y1 = _x * _s + _y *  _c + ( - x * _s - y *  _c );

_x2 = clamp( _x1, -sprite_xoffset, sprite_width-sprite_xoffset);
_y2 = clamp( _y1, -sprite_yoffset, sprite_height-sprite_yoffset);

_d = point_distance(_x1,_y1,_x2,_y2);

if _r = false
{
    calculate = true;
}
else
{
    if (_d < _r)
    {
        calculate = true;
    }
    else
    {
        calculate = false;
        r[0] = false;
        r[1] = false;
        r[2] = false;
        return r;
    }
}
if calculate = true
{
    _x3 = x + _x2 *  _c + _y2 * _s;
    _y3 = y + _x2 * -_s + _y2 * _c;
    r[0] = true;
    r[1] = _x3;
    r[2] = _y3;
    return r;
}
else
{
    r[0] = false;
    r[1] = false;
    r[2] = false;
    return r;
}
