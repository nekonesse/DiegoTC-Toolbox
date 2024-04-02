curs_x=wrap_val(curs_x,0,4)
curs_y=wrap_val(curs_y,0,2)

if input_check_pressed("accept") {
	TransitionStart(asset_get_index("lvl"+string(lvl[curs_x,curs_y])),sqRoomFadeOut,sqRoomFadeIn)
	audio_play_sound(snd_buttonselect,5,0)
}

if input_check_pressed("cancel") || input_check_pressed("pause") {
	TransitionStart(rm_menu,sqRoomFadeOut,sqRoomFadeIn)
	audio_play_sound(snd_buttonselect,5,0)
}