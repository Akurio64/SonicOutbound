/// stage_set_data()
 // Set the data for a stage, used in bv_stage_initialization().
 
    if(argument_count == 6)
    {
       zone_name             = argument[0];
       zone_act              = argument[1];
       zone_music            = argument[2];
       zone_music_loop_start = -1;
       zone_music_loop_end   = -1;       
       zone_music_hz         = -1;
       zone_water            = argument[3];
       zone_water_position   = argument[4];
       zone_death_position   = argument[5];
    }
    else if(argument_count > 6)
    {
       zone_name             = argument[0];
       zone_act              = argument[1];
       zone_music            = argument[2];
       zone_music_loop_start = argument[6];
       zone_music_loop_end   = argument[7];
       zone_music_hz         = argument[8];
       zone_water            = argument[3];
       zone_water_position   = argument[4];
       zone_death_position   = argument[5];
    }

 // Create stage elements (such as the culling controller and the title card)

    instance_create(0, 0, ctr_culling);
    instance_create(0, 0, obj_level_hud)
    if (room=rm_t_intro)=false{
    instance_create(0, 0, obj_title_card)
    }else{obj_character.input_lock_r=0
    obj_character.input_lock_l=0
    obj_character.start=true
    instance_create(0, 0, obj_fade_in)}
    if(zone_water == true)
    {
       instance_create(0, 0, obj_water_surface);
    }
   
 // If the stage has background music, play it,
    room_play_bgm(room, zone_music, zone_music_loop_start, zone_music_loop_end, zone_music_hz);

