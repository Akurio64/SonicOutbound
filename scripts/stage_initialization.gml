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
           case rm_hssz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 1, msc_hsz1, true, 224, room_height, 315946, 6694951, 44100);
                 global.zone_id=1
                 break;
           }
           case rm_hssz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 1, msc_hsz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=2
                 break;
           }
           case rm_spz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("SUNSET PARK", 1, msc_spz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=3
                 break;
           }
           case rm_spz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("SUNSET PARK", 2, msc_spz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=4
                 break;
           }
           case rm_slz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("STAR LIGHT", 1, msc_slz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=5
                 break;
           }
           case rm_slz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("STAR LIGHT", 2, msc_slz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=6
                 break;
           }
           case rm_ttz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("TECHNO TURRET", 1, msc_slz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=7
                 break;
           }
           case rm_ttz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("TECHNO TURRET", 2, msc_slz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=8
                 break;
           }
           case rm_rpz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("ROBOTROPOLIS", 1, msc_rpz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=9
                 break;
           }
           case rm_rpz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("ROBOTROPOLIS", 2, msc_rpz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=10
                 break;
           }
           case rm_tpz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("TIME PALACE", 1, msc_tpz_1_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=11
                 break;
           }
           case rm_tpz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("TIME PALACE", 2, msc_tpz_2_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=12
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

