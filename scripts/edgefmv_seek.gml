///edgefmv_seek(time);

/*
Directly sets the current FMV to play at the given time, in seconds.
Fractional values are acceptable. Recommended to use in conjunction
with edgefmv_draw_progress.

argument0 = the time to seek FMV to, in seconds (real)

Example usage: edgefmv_seek(12.34);
*/

//Set video time
global.fmv_frame_time = argument0;

//Set audio time
if global.fmv_audio_exists == true {
   audio_sound_set_track_position(global.fmv_audio, argument0);
}
