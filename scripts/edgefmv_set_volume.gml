///edgefmv_set_volume(volume);

/*
Sets the volume of the current FMV, where 0 is silent and 1 is full volume.
Volume will smoothly transition between values.

argument0 = the volume to set, between 0 and 1 (real)

Example usage: edgefmv_set_volume(0.75);
*/

//Set the volume of the current FMV
global.fmv_audio_volume = clamp(argument0,0,1);
