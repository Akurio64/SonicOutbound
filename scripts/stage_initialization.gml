/// stage_initialization()
 // Set the init. data for the stage.
 
if(global.save_selected != 0)
             {
               save_create(global.save_selected);
             }   
 
    switch(room)
    {
           case rm_t_intro:
           {
              // Test Stage (Act 2)
                 stage_set_data("TITANIC MONARCH", 2, msc_phantom_egg, false, -1, room_height, 315946, 6694951, 44100);
                 break;
           }
           case rm_slz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("STAR LIGHT", 1, msc_slz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=1
                 break;
           }
           case rm_slz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("STAR LIGHT", 2, msc_slz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=2
                 break;
           }
           default: // Keep this at the bottom.
           {
              // Default/Template:
              // stage_set_data(Stage Name, Act, Music, Has Water, Water Position, Death Position, *Loop Start, *Loop End, *HZ) * = Optional.
                 stage_set_data("", 1, msc_slz1, false, -1, room_height, 315946, 6694951, 44100);
                 break;
           }           
    }

