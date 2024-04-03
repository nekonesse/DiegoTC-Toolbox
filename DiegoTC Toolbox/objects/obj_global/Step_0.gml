audio_group_set_gain(soundgroup,soundvol,0)
audio_group_set_gain(musicgroup,musicvol,0)

if (paused) {
	selected=wrap_val(selected,0,array_length(menus)-1)
	
	if input_check_pressed("menuup") {
	selected-=1;
	audio_play_sound(snd_buttonhover,5,0)
	}
	else if input_check_pressed("menudown") {
		selected+=1;
		audio_play_sound(snd_buttonhover,5,0)
	}
	
	if input_check_pressed("accept") || input_check_pressed("pause") || input_check_pressed("cancel") {
		switch(selected) {
			case 0: paused=0 break;
			case 3: paused=0 TransitionStart(rm_lvlselect,sqRoomFadeOut,sqRoomFadeIn) break;
		}
	}

	if (selected == 1) {
		if input_check_pressed("left") {
			obj_global.soundvol-=0.05
			audio_play_sound(snd_buttonhover,5,0)
		} else if input_check_pressed("right") {
			obj_global.soundvol+=0.05
			audio_play_sound(snd_buttonhover,5,0)
		}
		obj_global.soundvol=clamp(obj_global.soundvol,0,1)
	} else if (selected == 2) {
		if input_check_pressed("left") {
			obj_global.musicvol-=0.05
			audio_play_sound(snd_buttonhover,5,0)
		} else if input_check_pressed("right") {
			obj_global.musicvol+=0.05
			audio_play_sound(snd_buttonhover,5,0)
		}
		obj_global.musicvol=clamp(obj_global.musicvol,0,1)
	}
} else if input_check_pressed("pause") && (pausable) && !(paused) {
	paused=1
	selected=0;
}