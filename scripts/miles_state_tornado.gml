if (input_special_pressed)
{
miles_tornado_timer=90
state=CS_TORNADO
if abs(x_speed)<12{x_speed+=animation_direction}
}

if miles_tornado_timer=0
{
state=CS_DEFAULT
miles_tornado_timer=-10
}
else
{
if miles_tornado_timer>0
{
miles_tornado_timer-=1
}
}
