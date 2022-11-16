if (input_special_pressed)
{
if mega=false
{
mega=true
state=CS_MEGA
if ground=false
{
audio_play(_shield_use_insta, global.sfx_volume); 
}
if input_up{y_speed=-9}else if input_down{y_speed=9}
}
}

if mega=true
{
if ground=true
{
state=CS_DEFAULT
mega=false
}
else
{
if (input_right)
{
x_speed+=0.05
}
else if (input_left)
{
x_speed-=0.05
}
}
}
