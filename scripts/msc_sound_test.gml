if sound!=0
    {
        if sound<=24 or sound>=40 && sound<=40+24 or sound>=73 && sound<=72+24
            {
                
                if sound mod 2 == 1
                    {
                        draw_text(212,96,"Act 1")
                        }
                    else
                        if sound mod 2 == 0
                            {
                                draw_text(212,96,"Act 2")
                                }
                
                if ceil(sound/2) mod 4 = 1
                    {
                        draw_text(212,96+32,"Present")
                        }
                    else
                        if ceil(sound/2) mod 4 = 2
                            {
                                draw_text(212,96+32, '"P" Mix');
                                }              
                            else 
                                if ceil(sound/2) mod 4 = 3
                                    {
                                        draw_text(212,96+32, '"G" Mix');
                                        }
                                    else
                                        if ceil(sound/2) mod 4 = 0
                                            {
                                                draw_text(212,96+32, '"B" Mix');
                                                }
                                            }
                else if sound>=24 && sound<=28
                    {
                        if sound=25{draw_text(212,96,"Act 1");draw_text(212,96+32,"Normal");}       
                        if sound=26{draw_text(212,96,"Act 1");draw_text(212,96+32,"Virtual");}  
                        if sound=27{draw_text(212,96,"Act 2");draw_text(212,96+32,"Normal");}
                        if sound=28{draw_text(212,96,"Act 2");draw_text(212,96+32,"Placeholder");}
                        }
                        
            else if sound>=28 && sound<=36
                {
                    draw_set_font(global.font_main)
                    
                    if sound mod 2 == 1
                        {
                            draw_text(212,96,"Act 1")
                            }
                        else
                            if sound mod 2 == 0
                                {
                                    draw_text(212,96,"Act 2")
                                    }
                    
                    if ceil(sound/2) mod 4 = 1
                        {
                            draw_text(212,96+32, '"G" Mix');
                            }
                        else
                            if ceil(sound/2) mod 4 = 2
                                {
                                    draw_text(212,96+32, '"B" Mix');
                                    }              
                                else 
                                    if ceil(sound/2) mod 4 = 3
                                        {
                                            draw_text(212,96+32,"Present")
                                            }
                                        else
                                            if ceil(sound/2) mod 4 = 0
                                                {
                                                    draw_text(212,96+32, '"P" Mix');
                                                    }
                                                }
                                        
                else if sound>=36 && sound<=40
                    {
                        if sound mod 2 == 1
                            {
                                draw_text(212,96+32,"Normal")
                                }
                            else
                                if sound mod 2 == 0
                                    {
                                        draw_text(212,96+32,"Chaotic")
                                        }
                                    
                                    
                if ceil(sound/2) mod 2 = 1
                    {
                        draw_text(212,96,"Act 1")
                        }
                    else
                        if ceil(sound/2) mod 2 = 0
                            {
                                draw_text(212,96,"Act 2")
                                }
                            }
                            
                 else if sound>=64 && sound<=72
                    {
                        if sound=65{draw_text(212,96,"Act 1");draw_text(212,96+32,"Normal");}       
                        if sound=66{draw_text(212,96,"Act 1");draw_text(212,96+32,"Thunderstorm");}  
                        if sound=67{draw_text(212,96,"Act 1");draw_text(212,96+32,"Snowstorm");}
                        if sound=68{draw_text(212,96,"Act 2");draw_text(212,96+32,"Normal");}
                        if sound=69{draw_text(212,96,"Act 2");draw_text(212,96+32,"Thunderstorm");}       
                        if sound=70{draw_text(212,96,"Act 2");draw_text(212,96+32,"Snowstorm");}  
                        if sound=71{draw_text(212,96,"Act 2");draw_text(212,96+32,"Heatwave");}
                        if sound=72{draw_text(212,96,"Act 2");draw_text(212,96+32,"Windstorm");}
                        }
                 
                 else if sound>=97 && sound<=114
                    {
                        if sound=97{draw_text(212,96,"Act 1");draw_text(212,96+32,"Normal");}       
                        if sound=98{draw_text(212,96,"Act 1");draw_text(212,96+32,"Volcano");}  
                        if sound=99{draw_text(212,96,"Act 1");draw_text(212,96+32,"Ruins");}
                        if sound=100{draw_text(212,96,"Act 1");draw_text(212,96+32,"Ice");}
                        if sound=101{draw_text(212,96,"Act 1");draw_text(212,96+32,"Waterfall");}       
                        if sound=102{draw_text(212,96,"Act 2");draw_text(212,96+32,"Normal");}  
                        if sound=103{draw_text(212,96,"Act 2");draw_text(212,96+32,"Volcano");}
                        if sound=104{draw_text(212,96,"Act 2");draw_text(212,96+32,"Ruins");}
                        if sound=105{draw_text(212,96,"Act 2");draw_text(212,96+32,"Ice");}       
                        if sound=106{draw_text(212,96,"Act 2");draw_text(212,96+32,"Waterfall");}  
                        if sound=107{draw_text(212,96,"Act 1");}
                        if sound=108{draw_text(212,96,"Act 2");}
                        if sound=109{draw_text(212,96-32,"Titanic Monarch Prologue");}
                        if sound=110{draw_text(212,96-32,"Hidden Palace Prologue");}
                        if sound=111{draw_text(212,96-32,"Title Theme");}
                        if sound=112{draw_text(212,96-32,"Menu Theme");}
                        if sound=113{draw_text(212,96-32,"Data Select Theme");}
                        if sound=114{draw_text(212,96-32,"Unknown Menu Theme");}
                        }

if sound<=24
    {
        if ceil(sound/8) mod 3 = 1
            {
                draw_text(212,96-32,"Heaven Shore Zone")
                }
            else
                if ceil(sound/8) mod 3 = 2
                    {
                        draw_text(212,96-32, "Sunset Park Zone");
                        }              
                    else 
                        if ceil(sound/8) mod 3 = 0
                            {
                                draw_text(212,96-32, "Star Light Zone");
                                }
                            }
else if sound>=24 && sound<=28
    {
        draw_text(212,96-32, "Techno Turret Zone");
        }
else if sound>=28 && sound<=36
    {
        draw_text(212,96-32, "Robotropolis Zone");
        }
else if sound>=36 && sound<=40
    {
        draw_text(212,96-32, "Time Palace Zone");
        }
else if sound>=40 && sound<=96
    {
        if ceil(sound/8) mod 7 = 6
            {
                draw_text(212,96-32,"Casino Night Zone")
                }
            else
                if ceil(sound/8) mod 7 = 0
                    {
                        draw_text(212,96-32, "Subnautic Zone");
                        }              
                    else 
                        if ceil(sound/8) mod 7 = 1
                            {
                                draw_text(212,96-32, "Launch Base Zone");
                                }
                            else 
                                if ceil(sound/8) mod 7 = 2
                                    {
                                        draw_text(212,96-32, "Climate Chaos Zone");
                                        }
                                    else 
                                        if ceil(sound/8) mod 7 = 3
                                            {
                                                draw_text(212,96-32, "Marble Zone");
                                                }
                                            else 
                                                if ceil(sound/8) mod 7 = 4
                                                    {
                                                        draw_text(212,96-32, "Ice Cap Zone");
                                                        }
                                                    else 
                                                        if ceil(sound/8) mod 7 = 5
                                                            {
                                                                draw_text(212,96-32, "Dubious Depths Zone");
                                                                }
                                                            }
                                                else if sound>=97 && sound<=106
                                                    {
                                                        draw_text(212,96-32, "Cloud Continent Zone");
                                                        }
                                                else if sound>=107 && sound<=108
                                                    {
                                                        draw_text(212,96-32, "Egg Behemoth Zone");
                                                        }
                                                    } 
