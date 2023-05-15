///edgefmv_play(framerate, a/v offset, x, y, xscale, yscale, rot, color, alpha, hidemouse, loop);
//                  0           1      2  3    4       5      6     7      8        9       10

/*
Plays an FMV file loaded with edgefmv_load, applying optional transforms and playback
adjustments if enabled.

Note that by default all videos created with MakeFMV will have a framerate of 30.

argument0  = the framerate of the input FMV (real)
argument1  = the number of frames to offset video from audio (integer)
argument2  = the x position to display the drawn FMV (real)
argument3  = the y position to display the drawn FMV (real)
argument4  = the horizontal scale factor of the FMV (real)
argument5  = the vertical scale factor of the FMV (real)
argument6  = the rotation of the FMV (real)
argument7  = the blending color of the FMV (color) (default c_white)
argument8  = the alpha transparency of the FMV (real) (0-1)
argument9  = enables or disables hiding the mouse during playback (boolean) (true/false)
argument10 = enables or disables looping the video endlessly until skipped (boolean) (true/false)

Example usage: edgefmv_play(30, 0, 0, 0, 1, 1, 0, c_white, 1, true, false);
*/

/*
INITIALIZATION
*/

//Skip if no video is loaded
if global.fmv_loaded == false {
   exit;
}

//Initialize FMV playback
if global.fmv_init == true {
   //Import audio from file, if any
   if file_exists(global.fmv_path + global.fmv_fname + ".ogg") {
      global.fmv_audio = audio_create_stream(global.fmv_path + global.fmv_fname + ".ogg");
      global.fmv_audio_exists = true;
   }
   
   //Reset frame index for frame detection
   global.fmv_frame_index = 0;
   
   //Detect frame count
   while file_exists(global.fmv_path + global.fmv_fname + "_" + string(global.fmv_frame_index) + "." + global.fmv_ext) {
      global.fmv_frame_count = global.fmv_frame_index;
      global.fmv_frame_index += 1;
   }
   
   //Crash prevention if frames are not found
   global.fmv_frame_count = max(global.fmv_frame_count,1);
   
   //Reset frame index for playback
   global.fmv_frame_index = 0;

   //Check for first frame
   if file_exists(global.fmv_path + global.fmv_fname + "_" + string(global.fmv_frame_index) + "." + global.fmv_ext) {
      //Import first frame, if found
      global.fmv_frame = sprite_add(global.fmv_path + global.fmv_fname + "_" + string(global.fmv_frame_index) + "." + global.fmv_ext,1,false,false,0,0); 
   } else {
      //Skip playback if file cannot be found (crash prevention)
      global.fmv_complete = true;
   }
   
   //Set framerate
   global.fmv_frame_rate = argument0;

   //Hide the mouse, if enabled
   if argument9 == true {
      window_set_cursor(cr_none);
   }
      
   //Disallow the screen from turning off (Android/iOS/WinPhone)
   os_powersave_enable(false);
      

   //End initialization
   global.fmv_init = false;
}


/*
PLAYBACK
*/

//If the FMV is incomplete...
if global.fmv_complete == false { 
   //Play video, if unpaused
   if global.fmv_pause == false {
      //Play audio, if any
      if global.fmv_audio_exists == true {
         if !audio_is_playing(global.fmv_audio) {
            global.fmv_audio = audio_play_sound(global.fmv_audio,1,false);
         }
      }
      
      //Set audio volume
      if audio_sound_get_gain(global.fmv_audio) != global.fmv_audio_volume {
         audio_sound_gain(global.fmv_audio,global.fmv_audio_volume,100);
      }
      
      //Increment frame time
      global.fmv_frame_time += delta_time/1000000;
      
      //Sync frame index to frame time + audio, if any
      if global.fmv_audio_exists == true {      
         //Sync video to frame time
         global.fmv_frame_index = floor(global.fmv_frame_count*(global.fmv_frame_time/(global.fmv_frame_count/global.fmv_frame_rate)));
         
         //Sync audio to video + offset
         if frac(global.fmv_frame_index/global.fmv_frame_rate) = 0 and ceil((audio_sound_get_track_position(global.fmv_audio) + (argument1/global.fmv_frame_rate))*global.fmv_frame_rate) != global.fmv_frame_index {
            audio_sound_set_track_position(global.fmv_audio,(global.fmv_frame_index/global.fmv_frame_rate) + (argument1/global.fmv_frame_rate));
         }          
      } else {
         //Sync frame index to frame time only, if no audio
         global.fmv_frame_index = floor(global.fmv_frame_count*(global.fmv_frame_time/(global.fmv_frame_count/global.fmv_frame_rate)));
      }
      
      //Increment framesync tracker
      global.fmv_frame_tracker += (room_speed*((room_speed/1000000)*delta_time));
      
      //Import frames with framesync
      if global.fmv_frame_tracker >= 1 {
         //Import next frame
         if global.fmv_frame_index <= global.fmv_frame_count {
            sprite_replace(global.fmv_frame,global.fmv_path + global.fmv_fname + "_" + string(global.fmv_frame_index) + "." + global.fmv_ext,1,false,false,(global.fmv_frame_width/argument4)*0.5,(global.fmv_frame_height/argument5)*0.5);
         }
         
         //Reset the framesync tracker      
         global.fmv_frame_tracker -= 1*((room_speed/1000000)*delta_time);
      }
   }
   
   //Get scaled frame dimensions
   global.fmv_frame_width = sprite_get_width(global.fmv_frame)*argument4;
   global.fmv_frame_height = sprite_get_height(global.fmv_frame)*argument5;    
   
   //Draw current frame
   if sprite_exists(global.fmv_frame) {
      draw_sprite_ext(global.fmv_frame, -1, argument2 + (global.fmv_frame_width*0.5), argument3 + (global.fmv_frame_height*0.5), argument4, argument5, argument6, argument7, argument8);
   }
   
   //Skip video, if skipped
   if global.fmv_skip == true {
      global.fmv_frame_index = global.fmv_frame_count + 1;
   }
   
   /*
   FINALIZATION
   */
   
   //When FMV is complete...
   if global.fmv_frame_index > global.fmv_frame_count {
   
      //Loop video until skipped, if enabled
      if argument10 == true and global.fmv_skip == false {
         //Restart video
         global.fmv_frame_index = 0;
         global.fmv_frame_time = 0;
         global.fmv_frame_tracker = 0;
         
         //Restart audio
         audio_sound_set_track_position(global.fmv_audio,0);
         exit;
      }
      
      //Stop audio, if playing
      if global.fmv_audio_exists == true {
         if audio_is_playing(global.fmv_audio) {
            audio_stop_sound(global.fmv_audio);
         }
         audio_destroy_stream(global.fmv_audio);
      }
      
      //Unload frame
      if sprite_exists(global.fmv_frame) {
         sprite_delete(global.fmv_frame);
      }
      
      //Unhide the mouse, if hidden
      if argument9 == true {
         window_set_cursor(cr_default);
      }
      
      //Reallow the screen to turn off (Android/iOS/WinPhone)
      os_powersave_enable(true);      
      
      //Reset vsync to default
      display_reset(0, false);
         
      //End the FMV
      global.fmv_complete = true;
   }   
}
