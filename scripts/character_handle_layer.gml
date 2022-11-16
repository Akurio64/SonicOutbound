/// character_handle_layer()
 // Script that handles layer switching.
 
 // Layer low:
    if(place_meeting(x, y, obj_layer_switch_low))
    {
       collision_layer = 0;
    }
    
 // Loop Layer low:
    if(place_meeting(x, y, obj_loop_switch_low))
    {
       if(x_speed > 0)
       {
          loop_direction = 1; 
       }   
       else
       {
          loop_direction = 0;
       }
       collision_layer = 0;
    }
     
 // Layer high:
    if(place_meeting(x, y, obj_layer_switch_high))
    {
       collision_layer = 1;
    }
    
 // Loop Layer high:
    if(place_meeting(x, y, obj_loop_switch_high))
    {
       if(x_speed < 0)
       {
          loop_direction = -1; 
       }   
       else
       {
          loop_direction = 0;
       }  
       collision_layer = 1;
    }      
     
 // Switch Layer:
    if(place_meeting(x, y, obj_layer_switch) && ground)
    {
       if(x_speed > 0)
       { 
          collision_layer = 1;
       }
       if(x_speed < 0)
       {
          collision_layer = 0;
       }
    }
    
 // Reset loop direction.
    if(!ground || x_speed == 0)
    {
       loop_direction = 0;
    }
