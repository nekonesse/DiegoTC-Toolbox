selected=wrap_val(selected,0,array_length(menus)-1)

if input_check_pressed("menuup")
selected-=1;
else if input_check_pressed("menudown")
selected+=1;

if input_check_pressed("accept") {
	if selected!=4
	TransitionStart(targets[selected],sqRoomFadeOut,sqRoomFadeIn)
	else {
		game_end();
	}
}