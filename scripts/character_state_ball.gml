if(ground == false)
    {
       if(input_action_pressed == true)
       {
       if(state == CS_SPRING_DIAGONAL || state == CS_FLYDROP || state == CS_BREATHE || state == CS_SPRING || state == CS_DEFAULT)
       {
        state=CS_ROLL    
       }
       }
    }
