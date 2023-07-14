/// stage_order()
 // This is used to load the proper stage after selecting a saved game.
 // Make sure to add global.zone_id to the room's creation code. (This should only be done in the first act)
 
 if global.character_index=0
 {
    if(global.zone_id == 1) room_goto (rm_hssz_act1);
    if(global.zone_id == 2) room_goto (rm_hssz_act2);
    if(global.zone_id == 3) room_goto (rm_spz_act1);
    if(global.zone_id == 4) room_goto (rm_spz_act2);
    if(global.zone_id == 5) room_goto (rm_slz_act1);
    if(global.zone_id == 6) room_goto (rm_slz_act2);
    if(global.zone_id == 7) room_goto (rm_ttz_act1);
    if(global.zone_id == 8) room_goto (rm_ttz_act2);
    if(global.zone_id == 9) room_goto (rm_rpz_act1);
    if(global.zone_id == 10) room_goto (rm_rpz_act2);
 }
 
 else if global.character_index=1
 {
    if(global.zone_id == 1) room_goto (rm_hstz_act1);
    if(global.zone_id == 2) room_goto (rm_hstz_act2);
    if(global.zone_id == 3) room_goto (rm_cnz_act1);
    if(global.zone_id == 4) room_goto (rm_cnz_act2);
    if(global.zone_id == 5) room_goto (rm_snz_act1);
    if(global.zone_id == 6) room_goto (rm_snz_act2);
    if(global.zone_id == 7) room_goto (rm_ttz_act1);
    if(global.zone_id == 8) room_goto (rm_ttz_act2);
    if(global.zone_id == 9) room_goto (rm_lbz_act1);
    if(global.zone_id == 10) room_goto (rm_lbz_act2);
  }
  
 else if global.character_index=2
 {
    if(global.zone_id == 1) room_goto (rm_hskz_act1);
    if(global.zone_id == 2) room_goto (rm_hskz_act2);
    if(global.zone_id == 3) room_goto (rm_vrz_act1);
    if(global.zone_id == 4) room_goto (rm_vrz_act2);
    if(global.zone_id == 5) room_goto (rm_icz_act1);
    if(global.zone_id == 6) room_goto (rm_icz_act2);
    if(global.zone_id == 7) room_goto (rm_ttz_act1);
    if(global.zone_id == 8) room_goto (rm_ttz_act2);
    if(global.zone_id == 9) room_goto (rm_srz_act1);
    if(global.zone_id ==10) room_goto (rm_srz_act2);
  }
