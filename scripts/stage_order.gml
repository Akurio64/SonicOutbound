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
              if global.character_index=0
                {
                return rm_hssz_act1
                break;
                }
              else if global.character_index=1
                {
                return rm_hstz_act1
                break;
                }
              else if global.character_index=2
                {
                return rm_hskz_act1
                break;
                }
                 
           }
           case rm_h_intro:
           {
              // Test Stage (Act 2)
              if global.character_index=0
                {
                return rm_hssz_act1
                break;
                }
              else if global.character_index=1
                {
                return rm_hstz_act1
                break;
                }
              else if global.character_index=2
                {
                return rm_hskz_act1
                break;
                }
                 
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
           case rm_hstz_act1:
           {
              // Test Stage (Act 2)
                 return rm_hstz_act2; 
                 break;
           }
           case rm_hstz_act2:
           {
              // Test Stage (Act 2)
                 return rm_cnz_act1; 
                 break;
           }
           case rm_hskz_act1:
           {
              // Test Stage (Act 2)
                 return rm_hskz_act2; 
                 break;
           }
           case rm_hskz_act2:
           {
              // Test Stage (Act 2)
                 return rm_vrz_act1; 
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
                break;
           } 
           
           
           case rm_cnz_act1:
           {
              // Test Stage (Act 2)
                 return rm_cnz_act2; 
                 break;
           }
           case rm_cnz_act2:
           {
              // Test Stage (Act 2)
                 return rm_snz_act1; 
                 break;
           }
           case rm_snz_act1:
           {
              // Test Stage (Act 2)
                 return rm_snz_act2; 
                 break;
           }
           
           case rm_vrz_act1:
           {
              // Test Stage (Act 2)
                 return rm_vrz_act2; 
                 break;
           }
           case rm_vrz_act2:
           {
              // Test Stage (Act 2)
                 return rm_icz_act1; 
                 break;
           }
           case rm_icz_act1:
           {
              // Test Stage (Act 2)
                 return rm_icz_act2; 
                 break;
           }
           
           case rm_icz_act2:
           {
                return rm_ttkz_act1
                break;
           } 
           
           case rm_snz_act2:
           {
                return rm_ttz_act1
                break;
           }
           
           case rm_ttz_act1:
           {
                return rm_ttz_act2
                break;
           } 
           case rm_ttkz_act1:
           {
                return rm_ttz_act2
                break;
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
                return rm_srz_act1
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
              // Back to the menu:
                 global.clives = 3;
                 global.crings = 0;
                 global.cscore = 0;
                 return rm_menu;
                 break;
           }
           case rm_lbz_act1:
           {
              // Test Stage (Act 2)
                 return rm_lbz_act2; 
                 break;
           }
           case rm_lbz_act2:
           {
              // Test Stage (Act 2)
                 // Back to the menu:
                 global.clives = 3;
                 global.crings = 0;
                 global.cscore = 0;
                 return rm_menu;
                 break;
           }
           
           case rm_srz_act1:
           {
              // Test Stage (Act 2)
                 return rm_srz_act2; 
                 break;
           }
           case rm_srz_act2:
           {
              // First stage, Test Stage (Act 1)
                 // Back to the menu:
                 global.clives = 3;
                 global.crings = 0;
                 global.cscore = 0;
                 return rm_menu;
                 break;
           }
           
           case rm_ebz_act1:
           {
              // Test Stage (Act 2)
                 return rm_ebz_act2; 
                 break;
           }
           case rm_ebz_act2:
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


