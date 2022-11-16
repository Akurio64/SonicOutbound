/* Script to handle Collapsing Platforms */
col_handle = instance_nearest(x, y, par_collapsing_terrain);
if ( ground = true and character_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, col_handle))
{
 with(col_handle)
 {
  if(alarm[0] == -1)
   {
    alarm[0] = 25;
   };
 };
};
