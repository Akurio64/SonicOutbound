if sound!=asset_get_index("_badnik_shot")-1
    {
        draw_text(212,96,"SFX"+string_place_number(sound-asset_get_index("_badnik_shot"),3,0))
        }
