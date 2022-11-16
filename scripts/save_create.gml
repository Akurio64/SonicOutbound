/// save_create(slot);
 // Creates a save file for this engine. Load using save_load(slot)
 // Since we can only store inis in the same folder as the game executable, we'll use text file instead.
 
 // Add a zero in front argument0 if it's less than 10.
    if(argument0 < 10)
    {
       argument0 = "0"+string(argument0);
    }
    
 // Store data:
    {
       // Encryption key:
          var dkey;
          dkey = $4ad682aeb7218;
       // Open save:
          var dfile;
          dfile = file_text_open_write(working_directory+"\Engine\Save\data"+string(argument0)+".sav");
       // Warning:
          file_text_write_string(dfile, ""+string(GAME_NAME)+" Save Data - Editing this file can cause issues.");
          file_text_writeln(dfile);
       // Zone:
          file_text_write_string(dfile, string(global.zone_id^dkey));
          file_text_writeln(dfile);
       // Lives:
          file_text_write_string(dfile, string(global.clives^dkey));
          file_text_writeln(dfile);       
       // Continues:
          file_text_write_string(dfile, string(global.ccontinues^dkey));
          file_text_writeln(dfile);                 
       // Emeralds
          file_text_write_string(dfile, string(global.cemeralds^dkey));
          file_text_writeln(dfile);            
       // Character:
          file_text_write_string(dfile, string(global.character_index^dkey));
          file_text_writeln(dfile); 
       // CPU:
          file_text_write_string(dfile, string(global.cpu_index^dkey));
          file_text_writeln(dfile);           
       // Game completed:
          file_text_write_string(dfile, string(global.game_completed^dkey));
          file_text_writeln(dfile);                
       // Close.                  
          file_text_close(dfile);
    }

