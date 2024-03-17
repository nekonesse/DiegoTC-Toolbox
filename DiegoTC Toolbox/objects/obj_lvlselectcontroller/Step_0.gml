curs_x=wrap_val(curs_x,0,4)
curs_y=wrap_val(curs_y,0,2)

if input_check_pressed("jump") {
	TransitionStart(asset_get_index("lvl"+string(lvl[curs_x,curs_y])),sqRoomFadeOut,sqRoomFadeIn)
}