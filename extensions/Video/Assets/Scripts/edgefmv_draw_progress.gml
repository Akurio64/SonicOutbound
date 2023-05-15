///edgefmv_draw_progress(x1, y1, x2, y2, col1, col2, col3, col4, outline);

/*
Draws a colored rectangle as a progress bar indicating video time position.
Bar is drawn between the two x/y coordinates as a 4-color gradient and can 
be displayed as either an outline or a solid. Recommended to use in
conjunction with edgefmv_seek

argument0 = x coordinate of the top-left corner of the progress bar (real)
argument1 = y coordinate of the top-left corner of the progress bar (real)
argument2 = x coordinate of the bottom-right corner of the progress bar (real)
argument3 = y coordinate of the bottom-right corner of the progress bar (real)
argument4 = the color of the top-left corner of the progress bar (color)
argument5 = the color of the top-right corner of the progress bar (color)
argument6 = the color of the bottom-right corner of the progress bar (color)
argument7 = the color of the bottom-left corner of the progress bar (color)
argument8 = sets the progress bar to draw as an outline or a solid (boolean) (true/false)

Example usage: edgefmv_draw_progress(50,50, view_wview[0] - 50, 100, c_white, c_white, c_ltgray, c_ltgray, false);
*/

//Draw the video position as a progress bar
draw_rectangle_colour(argument0,argument1,argument0 + ((argument2 - argument0)*(global.fmv_frame_index/max(global.fmv_frame_count,1))),argument3,argument4,argument5,argument6,argument7,argument8);
