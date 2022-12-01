///character_collision_right_object( x, y, angle, mask)
    
    // Store the actual mask for setting it up later
    var maskTemp
    maskTemp   =   mask_index;
    mask_index      =   argument3;

    // Transform angle to radians and precalculate cosine and sine
    argument2   = degtorad(argument2);
    cosine      = cos(argument2);
    sine        = sin(argument2);

    // Test collision
    var colTest
    colTest  =   instance_place( floor(argument0 + cosine * 11),
                                        floor(argument1 - sine * 11),
                                        argument4 );

    // Set to the old mask
    mask_index      =   maskTemp;
    
    // Calculate the direction
    return  colTest;
