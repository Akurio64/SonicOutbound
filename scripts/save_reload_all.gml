/// save_reload_all()
 // Reloads every save file again. Used when returning to the data select screen.

 // Load save slots:
    global.save_selected  = 1;  
    for(i=1; i<9; i+=1)
    {
        var _slot;
        _slot = save_load(i);

        if(_slot == true)
        {
           global.save_slot_zone      [i] = global.zone_id;
           global.save_slot_character [i] = global.character_index;
           global.save_slot_cpu       [i] = global.cpu_index;
           global.save_slot_lives     [i] = global.clives;           
           global.save_slot_continues [i] = global.ccontinues;               
           global.save_slot_emeralds  [i] = global.cemeralds;
           global.save_slot_completed [i] = global.game_completed;
           global.save_slot_shield    [i] = global.shield_index;
        }        
        else
        {
           global.save_slot_zone      [i] = 0;
           global.save_slot_character [i] = 1;
           global.save_slot_cpu       [i] = 0;
           global.save_slot_lives     [i] = 3;           
           global.save_slot_continues [i] = 0;               
           global.save_slot_emeralds  [i] = 0;
           global.save_slot_completed [i] = 0;
           global.save_slot_shield    [i] = 0
        }        
    }
