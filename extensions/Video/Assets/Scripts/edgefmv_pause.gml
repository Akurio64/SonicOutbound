///edgefmv_pause();

/*
Pauses and unpauses the current FMV, if any is playing

No parameters

Example usage: edgefmv_pause();
*/

//Ensure the given FMV exists and is playing
if global.fmv_complete == false {
   //Pause, if unpaused
   if global.fmv_pause == false {
      //Pause video
      global.fmv_pause = true;
      //Pause fmv_audio
      if global.fmv_audio_exists == true {
         if audio_is_playing(global.fmv_audio) {
            audio_pause_sound(global.fmv_audio);
         }
      }
      exit;
   }
   
   //Unpause, if paused
   if global.fmv_pause == true {
      //Unpause video
      global.fmv_pause = false;
      //Unpause fmv_audio
      if global.fmv_audio_exists == true {
         if audio_is_paused(global.fmv_audio) {
            audio_resume_sound(global.fmv_audio);
         }
      }
      exit;
   }   
}
