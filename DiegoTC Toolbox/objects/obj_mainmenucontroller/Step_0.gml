selected=wrap_val(selected,0,array_length(menus)-1)

if input_check_pressed("menuup") {
	selected-=1;
	audio_play_sound(snd_buttonhover,5,0)
}
else if input_check_pressed("menudown") {
	selected+=1;
	audio_play_sound(snd_buttonhover,5,0)
}

if input_check_pressed("accept") {
	if selected!=4 && !(selected == 0 || selected == 2) {
		audio_play_sound(snd_buttonselect,5,0)
		TransitionStart(targets[selected],sqRoomFadeOut,sqRoomFadeIn)
	}
	else if selected == 0 || selected == 2 {
		audio_play_sound(snd_buttonreject,5,0)
		fade=60;
	}
	else {
		audio_play_sound(snd_buttonselect,5,0)
		game_end();
	}
}

fade=approach_val(fade,0,1)