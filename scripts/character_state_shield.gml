/// character_state_shield();
 // The character shield state.
 
 // Only run if we have a shield and we're not invincible.
    if(shield_index != 0 && invincibility == 0)
    {
       // Fire shield.
       // ---------------------------------------------------------------------
          if(shield_index == SHIELD_FIRE)
          {
             if(shield_usable == true && input_action_pressed)
             {
                x_speed            = animation_direction*8;
                y_speed            = 0;
                shield_object      . image_xscale = animation_direction;
                shield_object      . sprite_index = spr_shield_flames_burst;
                shield_state       = 1;
                shield_usable      = false;
                if(global.setting_gameplay_camera_lag == true)    
                {         
                   ctr_camera.cam_lag = 16;              
                }
                audio_play(_shield_use_fire, global.sfx_volume);
                instance_create(x,y,obj_fire_particules2)  
             }
             if((shield_state == 1 && ground) || (state == CS_SPRING || state == CS_SPRING_DIAGONAL))
             {
                shield_object . sprite_index = spr_shield_flames;
                shield_state  = 0;
                instance_destroy(obj_fire_particules2)
             }
             if(shield_object.image_xscale != 1 && shield_state == 0)
             {
                shield_object.image_xscale = 1;
             }
             if(((character_collision_check(COL_RIGHT, MASK_BIG, x, y, angle)) || (character_collision_check(COL_LEFT, MASK_BIG, x, y, angle))))
             {
                if(shield_state == 1)
                {
                   shield_object . sprite_index = spr_shield_flames;
                   shield_state  = 0;  
                   instance_destroy(obj_fire_particules2)        
                }
            }
            if(ctr_camera.cam_lag == 0 && global.setting_gameplay_camera_lag == true || global.setting_gameplay_camera_lag == false && (shield_object.alarm[0] == -1 || ground == true))
            {
               if(shield_state == 1)
               {
                  shield_object . sprite_index = spr_shield_flames;
                  shield_state  = 0; 
                  instance_destroy(obj_fire_particules2)
               }
            }               
          }
          
       // Destroy fire / lightning shield underwater.
          if((shield_index == SHIELD_FIRE || shield_index == SHIELD_LIGHTNING) && physic_state == 1)
          {
             shield_index = 0;
             with(shield_object)
             {
                 instance_destroy();
             }
             shield_object = noone;
          }   
          
       // Bubble shield.
       // ---------------------------------------------------------------------       
          if(shield_index == SHIELD_BUBBLE)
          {             
             if(shield_usable == true && input_action_pressed)
             {
                x_speed       = 0;
                y_speed       = 8;
                shield_state  = 1;
                shield_usable = false;
                shield_object . shield_sprite_frame  = 0;
                shield_object . shield_overlay_frame = 0;                 
                shield_object . shield_sprite        = spr_shield_bubble_drop;                      
                state         = CS_JUMP;  
                jump_lock     = false;         
             }
             if(shield_state == 1 && ground)
             {
                ground = false;
                state  = CS_JUMP;
                if(physic_state == 0)
                {
                   y_speed = -(dsin(angle_relative) * g_speed) - (dcos(angle_relative) * 7.5); 
                }
                else
                {
                   y_speed = -(dsin(angle_relative) * g_speed) - (dcos(angle_relative) * 7.5/2);    
                }
                jump_completed                       = false;   
                jump_lock                            = false;   
                shield_state                         = 2;
                shield_usable                        = true;
                shield_object . shield_sprite_frame  = 0;
                shield_object . shield_overlay_frame = 0;                 
                shield_object . shield_sprite        = spr_shield_bubble_bounce; 
                audio_play(_shield_use_bubble, global.sfx_volume);               
             }
             if(shield_state >= 1 && (state == CS_SPRING || state == CS_SPRING_DIAGONAL) || state == CS_HURT)
             {
                shield_state  = 0;
                shield_usable = 0;
                shield_object . shield_sprite_frame  = 0;
                shield_object . shield_overlay_frame = 0;                 
                shield_object . shield_sprite        = spr_shield_bubble_bounce;                 
             }
          }
          
       // Lightning shield.
       // ---------------------------------------------------------------------     
          if(shield_index == SHIELD_LIGHTNING)
          {             
             if(shield_usable == true && input_action_pressed)
             {
                jump_completed = true;
                instance_create(x,y,obj_elec_particules2)
                y_speed        = -5.5;
                shield_usable  = false;
                jump_lock      = false; 
                audio_play(_shield_use_lightning, global.sfx_volume); 
                for(i=0; i<4; i+=1)
                {
                    _spark = instance_create(floor(x), floor(y), obj_lightning_spark);
                    switch(i)
                    {
                        case 0: { _spark._direction = 0;   break; }
                        case 1: { _spark._direction = 180; break; }
                        case 2: { _spark._direction = 224; break; }
                        case 3: { _spark._direction = 315; break; }
                    }
                }
             }
          }
          
       // Wind shield.
       // ---------------------------------------------------------------------
          if(shield_index == SHIELD_WIND)
          {
             if(shield_usable == true && input_action_pressed)
             {
             shield_usable = false; wind_timer=(abs(x_speed)*40)+120
             instance_create(x,y,obj_wind_particule2)
             }
             
             if input_action_released{wind_timer=0}
             
             if wind_timer>0{y_speed=0.15+wind_offset;wind_timer-=1;
             if audio_is_playing(_shield_use_wind)=false{audio_play(_shield_use_wind,global.sfx_volume)}
             if input_special{wind_offset-=0.02}else{wind_offset+=0.02}
             if input_up_released{if wind_offset<0{wind_offset+=1}}else if input_down_released{if wind_offset>0{wind_offset-=1}}
             }else{wind_offset=0;instance_destroy(obj_wind_particule2)}
    
          }
          
          
          // Rock shield.
       // ---------------------------------------------------------------------
          if(shield_index == SHIELD_ROCK)
          {
             if(shield_usable == true && input_action_pressed)
             {
                y_speed       = 25;
                shield_state  = 1;
                shield_usable = false;               
                state         = CS_JUMP;  
                jump_lock     = false;         
             }
             if(shield_state == 1 && ground)
             {
                ground = false;
                state  = CS_JUMP;
                ctr_camera.Camera_ShakeScreen   = true;
                ctr_camera.Camera_ShakeDuration = 20;
                ctr_camera.Camera_ShakeForce    = 4;
                with par_badnik{
                if (point_in_rectangle(x, y, view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0])) {
                if distance_to_object(par_terrain)<48{instance_destroy()}
                }
                }
                if(physic_state == 0)
                {
                   y_speed = -(dsin(angle_relative) * g_speed) - (dcos(angle_relative) * 3.5); 
                }
                else
                {
                   y_speed = -(dsin(angle_relative) * g_speed) - (dcos(angle_relative) * 3.5/2);    
                }
                jump_completed                       = false;   
                jump_lock                            = false;   
                shield_state                         = 2;
                shield_usable                        = true;
                audio_play(_shield_use_rock, global.sfx_volume);               
             }
             }
             if(shield_state >= 1 && (state == CS_SPRING || state == CS_SPRING_DIAGONAL) || state == CS_HURT)
             {
                shield_state  = 0;
                shield_usable = 0;              
             } 
          }
          
          

