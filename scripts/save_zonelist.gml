/// stage_order()
 // This is used to load the proper stage after selecting a saved game.
 // Make sure to add global.zone_id to the room's creation code. (This should only be done in the first act)
 
    if(global.zone_id == 1) room_goto (rm_hsz_act1);
    if(global.zone_id == 2) room_goto (rm_hsz_act2);
    if(global.zone_id == 3) room_goto (rm_slz_act1);
    if(global.zone_id == 4) room_goto (rm_slz_act2);
  //if(global.zone_id == 3) room_goto (rm_forgotten_jungle_act_1);    
  //if(global.zone_id == 4) room_goto (rm_greenhill_act_1);
  //if(global.zone_id == 5) room_goto (return rm_...);
  
