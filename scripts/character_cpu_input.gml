/// character_cpu_input()
 // Handles CPU input.

 // Exit if not initialized or death.
    if(is_initialized = false || state = CS_DEATH || state == CS_RESPAWN) exit;

 // Set parent to follow.
    follow_parent = obj_character;
 
 // Check follower coordinates and move according to that.   
    if(instance_exists(follow_parent) == true)
    {    
       // Move to the right.    
          if(follow_parent.loop_direction != -1)
          {
             if((x < follow_parent.x - 10 ||(follow_parent.y < y - 50 && follow_parent.ground == true && follow_parent.x_speed > 0))
             &&(follow_parent.y >= y - 50 || follow_parent.ground == false || follow_parent.x_speed >= 0)) 
             {           
                input_right = true;
             }
             else
             {
                input_right = false;
             }
          }
          
       // Move to the left.
          if(follow_parent.loop_direction != 1)
          {
             if((x > follow_parent.x + 10 ||(follow_parent.y < y - 50 && follow_parent.ground == true && follow_parent.x_speed < 0))
             &&(follow_parent.y >= y - 50 || follow_parent.ground == false || follow_parent.x_speed <= 0))              
             {
                input_left = true;            
             }
             else
             {
                input_left = false;
             }
          }
        
       // Reset delay timer.
          if(x_speed <> 0 || y_speed <> 0)
          {
             ai_state_delay = 16;
          }         
           
       // Lookup.
          if(ground == true && follow_parent.state == CS_LOOK)
          {
             if(state == CS_DEFAULT)
             {
                if(ai_state_delay > 0)
                {
                   ai_state_delay -= 1;
                }
                else
                {
                   ai_state_delay = 16;
                   state          = CS_LOOK;
                }
             }
             if(state == CS_LOOK)
             {
                input_up = follow_parent.input_up;
             }
          } 
       
       // Crouch & Spindash:
          if(ground == true && follow_parent.state == CS_CROUCH)
          {
             if(state == CS_DEFAULT)
             { 
                if(ai_state_delay > 0)
                {
                   ai_state_delay -= 1;
                }
                else
                {
                   ai_state_delay = 16;
                   state          = CS_CROUCH;
                   input_down     = true;
                }          
             }
             if(state == CS_CROUCH)
             {
                input_up   = follow_parent.input_up;
                input_down = follow_parent.input_down;
             }
          }             
          if(ground == true && follow_parent.state == CS_SPINDASH)
          {
             if(state == CS_CROUCH)
             {
                if(ai_state_delay > 0)
                {
                   ai_state_delay -= 1;
                }
                else
                {
                   ai_state_delay = 16;
                   state          = CS_SPINDASH;
                } 
             }
             if(state == CS_SPINDASH)
             {             
                input_down           = follow_parent.input_down;
                input_action_pressed = follow_parent.input_action_pressed;
             }
          }
          
       // Jump:
          if((ground == true) && follow_parent.y < y-50 && follow_parent.ground == false)
          {
             input_action_pressed = true;
          }
          else
          {
             input_action_pressed = false;
          }
          if(state == CS_JUMP)
          {
             input_action = true;
          }
          else
          {
             input_action = false;
          }
             
       // If the AI is stuck pushing a wall, make him jump.
          if(follow_parent.x < x-64 || follow_parent.x > x+64)
          {
             if(state == CS_PUSH)
             {
                input_action_pressed = true;
             }
          }
          
       // Respawn.
          if(x < view_xview-96 || x > view_xview+view_wview+96)
          {
             if(state != CS_RESPAWN)
             {
                if(obj_character.x > view_xview+view_wview/2)
                {
                   x = view_xview-50;
                   y = view_yview-50; 
                }  
                else
                {
                   x = view_xview+view_wview+50;
                   y = view_yview-50;                 
                }          
                character_state_respawn(1);
                death_timer = -5;    
             }         
          }
    }
