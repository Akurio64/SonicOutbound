///edgefmv_skip();

/*
Skips the current FMV, if any is playing

No parameters

Example usage: edgefmv_skip();
*/

//Ensure the given FMV exists and is playing
if global.fmv_complete == false {
   //Skip the FMV
   global.fmv_skip = true;
}
