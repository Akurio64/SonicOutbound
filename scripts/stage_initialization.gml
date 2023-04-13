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
                 stage_set_data("INTRODUCTION STAGE", 0, msc_phantom_egg, false, -1, room_height, 315946, 6694951, 44100);
                 break;
           }
           case rm_h_intro:
           {
              // Test Stage (Act 2)
                 stage_set_data("INTRODUCTION STAGE", 0, msc_hpz, false, -1, room_height, 315946, 6694951, 44100);
                 break;
           }
           case rm_hssz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 1, msc_hsz1, true, 976, room_height, 315946, 6694951, 44100);
                 global.zone_id=1
                 break;
           }
           case rm_hssz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 2, msc_hsz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=2
                 break;
           }
           case rm_hstz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 1, msc_hsz1, true, 224, room_height, 315946, 6694951, 44100);
                 global.zone_id=1
                 break;
           }
           case rm_hstz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 2, msc_hsz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=2
                 break;
           }
           case rm_hskz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 1, msc_hsz1, true, 224, room_height, 315946, 6694951, 44100);
                 global.zone_id=1
                 break;
           }
           case rm_hskz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("HEAVEN SHORE", 2, msc_hsz2, false, -1, room_height, 315946, 6694951, 44100);
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
           case rm_cnz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("CASINO NIGHT", 1, msc_cnz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=3
                 break;
           }
           case rm_cnz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("CASINO NIGHT", 2, msc_cnz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=4
                 break;
           }
           case rm_snz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("SUBNAUTIC", 1, msc_snz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=5
                 break;
           }
           case rm_snz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("SUBNAUTIC", 2, msc_snz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=6
                 break;
           }
           case rm_vrz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("VERDANT RUINS", 1, msc_vrz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=3
                 break;
           }
           case rm_vrz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("VERDANT RUINS", 2, msc_vrz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=4
                 break;
           }
           case rm_icz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("ICE CAP", 1, msc_icz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=5
                 break;
           }
           case rm_icz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("ICE CAP", 2, msc_icz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=6
                 break;
           }
           case rm_ttz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("TECHNO TURRET", 1, msc_ttz_1_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=7
                 break;
           }
           case rm_ttkz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("TECHNO TURRET", 1, msc_ttz_1_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=7
                 break;
           }
           case rm_ttz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("TECHNO TURRET", 2, msc_ttz2, false, -1, room_height, 315946, 6694951, 44100);
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
           case rm_lbz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("LAUNCH BASE", 1, msc_lbz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=9
                 break;
           }
           case rm_lbz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("LAUNCH BASE", 2, msc_lbz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=10
                 break;
           }
           case rm_ccz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("CLIMATE CHAOS", 1, msc_ccz1_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=11
                 break;
           }
           case rm_ccz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("CLIMATE CHAOS", 2, msc_ccz2_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=12
                 break;
           }
           case rm_mrz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("MARBLE", 1, msc_mrz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=9
                 break;
           }
           case rm_mrz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("MARBLE", 2, msc_mrz2, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=10
                 break;
           }
           case rm_srz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("SKY REALM", 1, msc_srz_1_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=11
                 break;
           }
           case rm_srz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("SKY REALM", 2, msc_srz_2_1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=12
                 break;
           }
           case rm_ebz_act1:
           {
              // Test Stage (Act 2)
                 stage_set_data("EGG BEHEMOTH", 1, msc_ebz1, false, -1, room_height, 315946, 6694951, 44100);
                 global.zone_id=11
                 break;
           }
           case rm_ebz_act2:
           {
              // Test Stage (Act 2)
                 stage_set_data("EGG BEHEMOTH", 2, msc_ebz2, false, -1, room_height, 315946, 6694951, 44100);
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

