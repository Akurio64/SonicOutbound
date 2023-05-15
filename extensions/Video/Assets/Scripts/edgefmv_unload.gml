///edgefmv_unload(fname);

/*
Resets core FMV variables to null and physically erases preload cache from 
system storage, if any.

argument0 = the filename of the desired FMV file, including extension (string)

Note that to unload all cached FMV files, the keyword 'all' can be supplied in
place of a filename, without quotes

Example usage: edgefmv_unload(all);
*/

/*
INITIALIZE
*/

//Get input path as string
var input = string(argument0);

//Separate path from input file
var path = input;

while string_count("\", path) > 1 {
   path = string_delete(path, string_pos("\", path), 1);
}

path = string_copy(input, 0, string_pos("\", path) + string_count("\", input) - 1);

//Separate filename without extension from input file
var fname = string_copy(input, string_length(path) + 1, string_pos(".", input) - (string_length(path) + 1));

//Separate extension from input file
var ext = string_copy(input, string_pos(".", input) + 1, string_length(input) - string_pos(".", input) + 1);


/*
FULL UNLOAD
*/

if real(argument0) == all {
   //Unload video
   global.fmv_fname = "";
   global.fmv_ext = "";
   global.fmv_path = "\";
   
   //Reset core FMV variables
   global.fmv_init = false;
   global.fmv_complete = true;
   global.fmv_loaded = false;
   global.fmv_pause = false;
   global.fmv_skip = false;

   //Reset core frame variables
   global.fmv_frame = -1;
   global.fmv_frame_count = 0;
   global.fmv_frame_index = 0;
   global.fmv_frame_rate = 0;
   global.fmv_frame_time = 0;
   global.fmv_frame_tracker = 0; 
   global.fmv_frame_width = 0;
   global.fmv_frame_height = 0;       
      
   //Stop audio, if playing
   if global.fmv_audio_exists == true {
      if audio_is_playing(global.fmv_audio) {
         audio_stop_sound(global.fmv_audio);
      }
      audio_destroy_stream(global.fmv_audio);
   }
   
   //Reset core audio variables
   global.fmv_audio = -1;
   global.fmv_audio_exists = false;
   global.fmv_audio_volume = 1;
      
   //Unload frame
   if sprite_exists(global.fmv_frame) {
      sprite_delete(global.fmv_frame);
   }
      
   //Unhide the mouse, if hidden
   if window_get_cursor() == cr_none {
      window_set_cursor(cr_default);
   }    
      
   //Reallow the screen to turn off (Android/iOS/WinPhone)
   os_powersave_enable(true);      
      
   //Reset vsync to default
   display_reset(0, false);    
   
   //Erase cache
   if directory_exists(working_directory + "\cache\fmv\") {   
      directory_destroy(working_directory + "\cache\fmv\");
   }
   
   //Exit the script, we're done!
   exit;
}


/*
PRECACHE UNLOAD
*/

if directory_exists(path + fname + "\") {
   //Check for precached files
   if file_exists(path + fname + "\" + fname + "_0." + ext) {
      //Unload video
      global.fmv_fname = ""; 
      global.fmv_ext = "";
      global.fmv_path = "\";
   
      //Reset core FMV variables
      global.fmv_init = false;
      global.fmv_complete = true;
      global.fmv_loaded = false;
      global.fmv_pause = false;
      global.fmv_skip = false;

      //Reset core frame variables
      global.fmv_frame = -1;
      global.fmv_frame_count = 0;
      global.fmv_frame_index = 0;
      global.fmv_frame_rate = 0;
      global.fmv_frame_time = 0;
      global.fmv_frame_tracker = 0;    
      global.fmv_frame_width = 0;
      global.fmv_frame_height = 0;      
      
      //Stop audio, if playing
      if global.fmv_audio_exists == true {
         if audio_is_playing(global.fmv_audio) {
            audio_stop_sound(global.fmv_audio);
         }
         audio_destroy_stream(global.fmv_audio);
      }
      
      //Reset core audio variables
      global.fmv_audio = -1;
      global.fmv_audio_exists = false;      
      global.fmv_audio_volume = 1;
      
      //Unload frame
      if sprite_exists(global.fmv_frame) {
         sprite_delete(global.fmv_frame);
      }
      
      //Unhide the mouse, if hidden
      if window_get_cursor() == cr_none {
         window_set_cursor(cr_default);
      }    
      
      //Reallow the screen to turn off (Android/iOS/WinPhone)
      os_powersave_enable(true);      
       
      //Reset vsync to default
      display_reset(0, false);    
   
      //Exit the script, we're done!
      exit;
   }
}
   

/*
PRELOAD UNLOAD
*/

if file_exists(argument0) {
   //Check for preload cache
   if directory_exists(working_directory + "\cache\fmv\" + fname + "\") {
      //Unload video
      global.fmv_fname = "";
      global.fmv_ext = "";
      global.fmv_path = "\";
   
      //Reset core FMV variables
      global.fmv_init = false;
      global.fmv_complete = true;
      global.fmv_loaded = false;
      global.fmv_pause = false;
      global.fmv_skip = false;

      //Reset core frame variables
      global.fmv_frame = -1;
      global.fmv_frame_count = 0;
      global.fmv_frame_index = 0;
      global.fmv_frame_rate = 0;
      global.fmv_frame_time = 0;
      global.fmv_frame_tracker = 0;   
      global.fmv_frame_width = 0;
      global.fmv_frame_height = 0;       
      
      //Stop audio, if playing
      if global.fmv_audio_exists == true {
         if audio_is_playing(global.fmv_audio) {
            audio_stop_sound(global.fmv_audio);
         }
         audio_destroy_stream(global.fmv_audio);
      }
      
      //Reset core audio variables
      global.fmv_audio = -1;
      global.fmv_audio_exists = false;     
      global.fmv_audio_volume = 1; 
      
      //Unload frame
      if sprite_exists(global.fmv_frame) {
         sprite_delete(global.fmv_frame);
      }
      
      //Unhide the mouse, if hidden
      if window_get_cursor() == cr_none {
         window_set_cursor(cr_default);
      }    
      
      //Reallow the screen to turn off (Android/iOS/WinPhone)
      os_powersave_enable(true);      
       
      //Reset vsync to default
      display_reset(0, false);    
      
      //Erase cache
      if directory_exists(working_directory + "\cache\fmv\" + fname + "\") {   
         directory_destroy(working_directory + "\cache\fmv\" + fname + "\");
      }      
   
      //Exit the script, we're done!
      exit;
   }
}
