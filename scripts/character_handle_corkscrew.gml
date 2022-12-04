/* Script to Handle Corkscrews */

if( state = CS_CORKSCREW || state = CS_CORKSCREW )
 {
  /* Initalize the Corkscrew Object: */
  var corkscrew_object;
  corkscrew_object = character_collision_check(COL_MAIN_OBJECT, x, y, par_corkscrew);
  
  /* Check Speed and Action and do stuff: */
  if ( abs(x_speed) < 4 ) { state = CS_DEFAULT };
   if( corkscrew_object == noone ) { state = CS_DEFAULT };
    else 
    {
      relative_position = x - corkscrew_object.x;
      angle_in_corkscrew = degtorad( (relative_position/384)*360 );
      
       /* Set position according to the relative position of the corkscrew */
        y = corkscrew_object.y + 26 + ( 1+cos(angle_in_corkscrew) )*( 75*0.5 );
        
       /* Change animation frame depending on the angle */
       if ( state == CS_CORKSCREW ) { animation_frame = abs((radtodeg(angle_in_corkscrew)/360*11) mod 12) };
    };
};
   else if( abs(x_speed) >= 6 && ground == true && character_collision_check(COL_MAIN_OBJECT, x, y, par_corkscrew) != noone )
    {
     if( state == CS_ROLL ) { state = CS_CORKSCREW };
      else { state = CS_CORKSCREW };
      
      /* Common Stuff */
      ground = false;
      angle=0;
    };


