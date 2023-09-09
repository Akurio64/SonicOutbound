/// character_handle_monitor()
 // Script to handle monitors.
 
 // Monitor handle:
    var _monitor;
        _monitor = instance_nearest(x, y, par_monitor);
        
    if(_monitor != noone)
    {
        if place_meeting(x,y,_monitor.touch) = true
        {
            // Destroy monitor:
                        _monitor.parent = id;             
                        with(_monitor)
                        {
                             instance_destroy()
                        }
                    }
                }
