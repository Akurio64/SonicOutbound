/// character_handle_monitor()
 // Script to handle monitors.
 
 // Monitor handle:
    var _monitor;
        _monitor = instance_nearest(x, y, par_monitor);
        
    if(_monitor != noone)
    {
        if place_meeting(x,y,_monitor.touch) = true
        {
            if((state == CS_JUMP || 
                state == CS_ROLL || 
                state == CS_SPINDASH || 
                state == CS_FLY || 
                state == CS_GLIDE || 
                state == CS_SLIDE || 
                invincibility == 2 || 
                shield_state == 1 || 
                state == CS_TORNADO || 
                state == CS_MEGA) )
            {
            // Destroy monitor:
                        _monitor.parent = id;             
                        with(_monitor)
                        {
                             instance_destroy()
                        }
                        
                        // Rebound:
                        y_speed       *= 1.5
                         ground         = false;
                         if(roll_rebounce == false)
                         {
                            jump_completed  = false;
                         }
                     }
                 }
             }
