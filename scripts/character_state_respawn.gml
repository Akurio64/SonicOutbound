/// character_state_respawn()
 // Used for AI players to respawn.
 
 // Trigger respawn.
    if(argument0 == 1)
    {
       state               = CS_RESPAWN;    
       angle               = 0;
       animation_angle     = 0;
       miles_tail_angle    = 0;
       invincibility       = 1;
       invincibility_timer = -1;
       animation_frame     = 0;
       tunnel_lock         = false;
    }
  
 // Don't run if not respawning.
    if(state != CS_RESPAWN) exit;
  
 // Reposition.
    if(state == CS_RESPAWN && x < view_xview-80)
    {
       x = view_xview-50;
       y = view_yview-50;
       character_state_respawn(1);       
    }

 // Respawn (Sonic)
    if(instance_exists(obj_character) && character_id == CHAR_SONIC)
    {
       if(obj_character.tunnel_lock == false)
       {
          x               = obj_character.x;
          y               = obj_character.y;
          x_speed         = obj_character.x_speed;
          y_speed         = obj_character.y_speed;
          angle           = obj_character.angle;
          state           = obj_character.state;
          depth           = obj_character.depth+1;
          if(character_id == CHAR_SONIC && (obj_character.state == CS_FLY || obj_character.state == CS_FLYDROP))
          {
             state = CS_ROLL;
          } 
       }
    }  
    
 // Respawn (Tails)
    if(instance_exists(obj_character) && (character_id == CHAR_TAILS || character_id == CHAR_KNUX))
    {    
       // Move towards player.
          _dir = point_direction(x, y, obj_character.x, obj_character.y);
          x   += lengthdir_x(3, _dir);
          y   += lengthdir_y(3, _dir); 
       
       // Disable movement flags.
          x_allow     = 0;
          y_allow     = 0;
          tunnel_lock = 0;    
                      
       // Set speed flags.
          x_speed = 0;
          y_speed = 0;         
         
       // Finish respawn.
          if(obj_character.ground == true && obj_character.tunnel_lock == false)
          {
             if(distance_to_object(obj_character) <= 0.5 && place_free(x, y) && in_view() == true)
             {
                if(character_id == CHAR_TAILS)
                {
                   state = CS_ROLL;
                }
                else
                {
                   state = CS_GLIDE_DROP;
                }
                depth       = obj_character.depth+1;
                x_allow     = 1;
                y_allow     = 1;
                tunnel_lock = false;
             }
          }
          else if(obj_character.ground == false)
          {
                  if(instance_place(x, y, obj_character) && in_view() == true)
                  { 
                     if(character_id == CHAR_TAILS)
                     {
                        state = CS_ROLL;
                     }
                     else
                     {
                        state = CS_GLIDE_DROP;
                     }
                     depth = obj_character.depth+1;
                     x_allow     = 1;
                     y_allow     = 1;
                     tunnel_lock = false;                     
                  }  
          }
          else
          {
             state = CS_RESPAWN;
          }                     
    }      
    


