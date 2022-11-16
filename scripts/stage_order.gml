/// stage_order()
 // Set the zone/stage order in here.

 // Reset checkpoint data.
    global.checkpoint_x = -1;
    global.checkpoint_y = -1;
    global.checkpoint_t =  0; 
    
 // Get next stage.
    switch(room)
    {
           case rm_slz_act1:
           {
              // Test Stage (Act 2)
                 return rm_slz_act2; 
                 break;
           }
           case rm_slz_act2:
           {
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
                 return rm_slz_act1;
                 break;
           }               
    }


