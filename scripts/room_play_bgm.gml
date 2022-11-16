/// room_play_bgm(room id, music id, loopstart, loopend, hz);
 // Play background music.
  
    if(room == argument0)
    {
       if(argument2 != -1)
       {
          SFX.bgm_loop_start = argument2;
          SFX.bgm_loop_end   = argument3;
          SFX.bgm_hz         = argument4;
       }
       else
       {
          SFX.bgm_loop_start = -1;
          SFX.bgm_loop_end   = -1;
          SFX.bgm_hz         = -1;       
       }
       global._bgmHandle = audio_loop(argument1, global.bgm_volume);       
    }
 

