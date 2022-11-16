/* Script to Handle Breaking walls. */

//Normal Breakable Walls:
if(state == CS_ROLL){
   // Get if a Wall has collided with the player while rolling:
   if (x_speed >= 0) wall_handle = character_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, par_break_walls);
   if (x_speed <= 0) wall_handle = character_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, par_break_walls);
    
    // Destroy
    if(wall_handle != noone){
    audio_stop(_general_collapse)
    audio_play(_general_collapse,global.sfx_volume)
    /* Play Destroy Sounds: */
         with(wall_handle) instance_destroy();
     };
}

