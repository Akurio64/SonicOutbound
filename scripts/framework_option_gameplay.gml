/// framework_option_gameplay()
 // The Gameplay settings.
 
 // Change Settings:
    if(option_in_page == false && option_selected == 3)
    {
      option_string_description = "Toggle the Spindash ability.";
    }
    
    if(option_in_page == true && option_change_mode == 0 && option_change_timer == 0)
    {
    
    switch(option_selected_in_page)
    {
           case 0:
           {
               option_string_description = "When disabled#Allow the character to change directions mid air after a roll jump.";          
               if(keyboard_check_pressed(global.ip_right) || (joy_hat_x(0) == 1 && (GMP.dpad_right == 0)))
               {
                  if(global.setting_gameplay_aerial_lock == false)
                  {
                     global.setting_gameplay_aerial_lock = true;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                       
                  }                  
               } 
               if(keyboard_check_pressed(global.ip_left) || (joy_hat_x(0) == -1 && (GMP.dpad_left == 0)))
               {
                  if(global.setting_gameplay_aerial_lock == true)
                  {
                     global.setting_gameplay_aerial_lock = false;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                        
                  }               
               }                            
               break;
           } 
           case 1:
           {
               option_string_description = "Allow the Character to trigger rolling while holding left or right.";          
               if(keyboard_check_pressed(global.ip_right) || (joy_hat_x(0) == 1 && (GMP.dpad_right == 0)))
               {
                  if(global.setting_gameplay_roll_trigger == false)
                  {
                     global.setting_gameplay_roll_trigger = true;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                       
                  }                  
               } 
               if(keyboard_check_pressed(global.ip_left) || (joy_hat_x(0) == -1 && (GMP.dpad_left == 0)))
               {
                  if(global.setting_gameplay_roll_trigger == true)
                  {
                     global.setting_gameplay_roll_trigger = false;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                        
                  }               
               }                            
               break;
           }   
           case 2:
           {
               option_string_description = "Toggle the Camera freeze/lag effect.";          
               if(keyboard_check_pressed(global.ip_right) || (joy_hat_x(0) == 1 && (GMP.dpad_right == 0)))
               {
                  if(global.setting_gameplay_camera_lag == false)
                  {
                     global.setting_gameplay_camera_lag = true;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                       
                  }                  
               } 
               if(keyboard_check_pressed(global.ip_left) || (joy_hat_x(0) == -1 && (GMP.dpad_left == 0)))
               {
                  if(global.setting_gameplay_camera_lag == true)
                  {
                     global.setting_gameplay_camera_lag = false;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                        
                  }               
               }                            
               break;
           } 
           case 3:
           {
               option_string_description = "Toggle the Rotation method for the Character.";          
               if(keyboard_check_pressed(global.ip_right) || (joy_hat_x(0) == 1 && (GMP.dpad_right == 0)))
               {
                  if(global.setting_gameplay_rotation == false)
                  {
                     global.setting_gameplay_rotation = true;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                       
                  }                  
               } 
               if(keyboard_check_pressed(global.ip_left) || (joy_hat_x(0) == -1 && (GMP.dpad_left == 0)))
               {
                  if(global.setting_gameplay_rotation == true)
                  {
                     global.setting_gameplay_rotation = false;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                        
                  }               
               }                            
               break;
           }             
           case 4:
           {
               option_string_description = "Toggle Discord Rich Presence.#Various stats will be shown on your Discord profile!";          
               if(keyboard_check_pressed(global.ip_right) || (joy_hat_x(0) == 1 && (GMP.dpad_right == 0)))
               {
                  if(global.setting_gameplay_discord == false)
                  {
                     global.setting_gameplay_discord = true;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                       
                  }                  
               } 
               if(keyboard_check_pressed(global.ip_left) || (joy_hat_x(0) == -1 && (GMP.dpad_left == 0)))
               {
                  if(global.setting_gameplay_discord == true)
                  {
                     global.setting_gameplay_discord = false;
                     if(audio_is_playing(_general_menu_bleep) == true)
                     {
                        audio_stop(_general_menu_bleep);
                     }
                     audio_play(_general_menu_bleep, global.sfx_volume);                        
                  }               
               }                            
               break;
           }                                                                                                                 
    }  
    
    }

