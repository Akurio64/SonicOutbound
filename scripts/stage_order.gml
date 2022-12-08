/// stage_order()
 // Set the zone/stage order in here.

 // Reset checkpoint data.
    global.checkpoint_x = -1;
    global.checkpoint_y = -1;
    global.checkpoint_t =  0; 
    
 // Get next stage.
    switch(room)
    {   
        // Sonic
            case rm_t_intro:
           {
              // Test Stage (Act 2)
                 return rm_hssz_act1; 
                 break;
           }
           case rm_hssz_act1:
           {
              // Test Stage (Act 2)
                 return rm_hssz_act2; 
                 break;
           }
           case rm_hssz_act2:
           {
              // Test Stage (Act 2)
                 return rm_spz_act1; 
                 break;
           }
           case rm_spz_act1:
           {
              // Test Stage (Act 2)
                 return rm_spz_act2; 
                 break;
           }
           case rm_spz_act2:
           {
              // Test Stage (Act 2)
                 return rm_slz_act1; 
                 break;
           }
           case rm_slz_act1:
           {
              // Test Stage (Act 2)
                 return rm_slz_act2; 
                 break;
           }
           
           case rm_slz_act2:
           {
                return rm_ttz_act1
           } 
           
           case rm_ttz_act1:
           {
                return rm_ttz_act2
           } 
           
           case rm_ttz_act2:
           {
                if global.character_index=0
                {
                return rm_rpz_act1
                }
                else if global.character_index=1
                {
                return rm_lbz_act1
                }
                else if global.character_index=2
                {
                return rm_mrz_act1
                }
            }
            case rm_rpz_act1:
           {
              // Test Stage (Act 2)
                 return rm_rpz_act2; 
                 break;
           }
           case rm_rpz_act2:
           {
              // Test Stage (Act 2)
                 return rm_tpz_act1; 
                 break;
           }
           case rm_tpz_act1:
           {
              // Test Stage (Act 2)
                 return rm_tpz_act2; 
                 break;
           }
           case rm_tpz_act2:
           {
              // First stage, Test Stage (Act 1)
                 // Back to the menu:
                 global.clives = 3;
                 global.crings = 0;
                 global.cscore = 0;
                 return rm_menu;
                 break;
           }
           default: // Keep this at the bottom.
           {
              // First stage, Test Stage (Act 1)
                 // Back to the menu:
                 global.clives = 3;
                 global.crings = 0;
                 global.cscore = 0;
                 return rm_menu;
                 break;
           }               
    }


