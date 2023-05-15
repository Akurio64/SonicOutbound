///edgefmv_get_time();

/*
Returns the playback time of the current FMV, in seconds. Can be used
in custom code to trigger actions at certain points during FMV playback.

No parameters
*/

if global.fmv_frame_index > 0 {
   return global.fmv_frame_index/global.fmv_frame_rate;
} else {
   return 0;
}
