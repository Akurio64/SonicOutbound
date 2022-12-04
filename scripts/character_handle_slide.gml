
   handle_slide = character_collision_check(COL_MAIN_OBJECT, x, y, par_slide);
   if (handle_slide != noone && ground && y_speed >= 0 && state != CS_SLIDE2)
   {
      
        state = CS_SLIDE2;
        animation_angle=handle_slide.angle
       
        animation_direction = handle_slide.Direction; // 1: Right  -1: Left Found in individual objects
         if handle_slide.water==true
         {
        /*Create Splash Effect
        scr_dummy_effect(spr_water_splash,0.5,x,y+6,1,-500);
 
        //Play Splashing Sound
        sound_stop(snd_sfx_water_splash);
        sound_play(snd_sfx_water_splash);*/
        
         }
         
              if handle_slide.water==false
         {
          //(snd_player_spin_release)
        //animation
         animation = "ROLL";
         }

   }
   if (handle_slide != noone && state == CS_SLIDE2)
   {
   animation_direction = handle_slide.Direction;
   x_speed = x_speed + 1/2*handle_slide.Direction;
   if (abs(x_speed) >= 16) x_speed = 16*handle_slide.Direction;
      /*if (animation_direction == 1 && x_speed < 0) x_speed = x_speed + 1/2;
      if (animation_direction == -1 && x_speed > 0) x_speed = x_speed - 1/2;
      
      if (animation_direction == 1 && x_speed < x_speed_top) x_speed = x_speed + 1/4;
      if (animation_direction == -1 && x_speed > -x_speed_top) x_speed = x_speed - 1/4;*/
   }
   
   else if (handle_slide == noone && state == CS_SLIDE2)
   {
      state = CS_DEFAULT;
   }
   

