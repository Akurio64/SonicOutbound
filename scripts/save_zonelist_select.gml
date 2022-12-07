/// stage_order()
 // This is used to load the proper stage after selecting a saved game.
 // Make sure to add argument0 to the room's creation code. (This should only be done in the first act)
 
 if global.character_index=0
 {
    if(argument0 == 1) return (rm_hssz_act1);
    if(argument0 == 2) return (rm_hssz_act2);
    if(argument0 == 3) return (rm_spz_act1);
    if(argument0 == 4) return (rm_spz_act2);
    if(argument0 == 7) return (rm_slz_act1);
    if(argument0 == 8) return (rm_slz_act2);
    if(argument0 == 5) return (rm_ttz_act1);
    if(argument0 == 6) return (rm_ttz_act2);
    if(argument0 == 8) return (rm_rpz_act1);
    if(argument0 == 9) return (rm_rpz_act2);
    if(argument0 ==10) return (rm_tpz_act1);
    if(argument0 ==11) return (rm_tpz_act2);
 }
 
 else if global.character_index=1
 {
    if(argument0 == 1) return (rm_hstz_act1);
    if(argument0 == 2) return (rm_hstz_act2);
    if(argument0 == 3) return (rm_cnz_act1);
    if(argument0 == 4) return (rm_cnz_act2);
    if(argument0 == 7) return (rm_sbz_act1);
    if(argument0 == 8) return (rm_sbz_act2);
    if(argument0 == 5) return (rm_ttz_act1);
    if(argument0 == 6) return (rm_ttz_act2);
    if(argument0 == 8) return (rm_lbz_act1);
    if(argument0 == 9) return (rm_lbz_act2);
    if(argument0 ==10) return (rm_ccz_act1);
    if(argument0 ==11) return (rm_ccz_act2);
  }
  
 else if global.character_index=2
 {
    if(argument0 == 1) return (rm_hskz_act1);
    if(argument0 == 2) return (rm_hskz_act2);
    if(argument0 == 3) return (rm_vrz_act1);
    if(argument0 == 4) return (rm_vrz_act2);
    if(argument0 == 7) return (rm_icz_act1);
    if(argument0 == 8) return (rm_icz_act2);
    if(argument0 == 5) return (rm_ttz_act1);
    if(argument0 == 6) return (rm_ttz_act2);
    if(argument0 == 8) return (rm_mrz_act1);
    if(argument0 == 9) return (rm_mrz_act2);
    if(argument0 ==10) return (rm_srz_act1);
    if(argument0 ==11) return (rm_srz_act2);
  }
