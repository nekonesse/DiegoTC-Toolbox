///this code kinda Sucks
if !(in_input)
selected=wrap_val(selected,0,array_length(menus)-1)
else
selected=wrap_val(selected,0,array_length(keybinds)-1)

selectedx=wrap_val(selectedx,0,2)

if input_check_pressed("menuup") {
	selected-=1;
	audio_play_sound(snd_buttonhover,5,0)
}
else if input_check_pressed("menudown") {
	selected+=1;
	audio_play_sound(snd_buttonhover,5,0)
}

if input_check_pressed("cancel") || input_check_pressed("pause") {
	if !(in_input)
	TransitionStart(rm_menu,sqRoomFadeOut,sqRoomFadeIn);
	else
	in_input=0;
	
	audio_play_sound(snd_buttonselect,5,0)
}

if input_check_pressed("accept") {
	if !(in_input) {
		switch(selected) {
			case 0: {
				if selectedx!=2 {
					obj_global.res=selectedx+1
					window_set_fullscreen(0)
					window_set_size(960*obj_global.res,540*obj_global.res) 
				} else window_set_fullscreen(1)
				window_center()
				audio_play_sound(snd_buttonselect,5,0)
			break;
			}
			case 3: obj_global.vsync=!obj_global.vsync display_reset(0,obj_global.vsync) audio_play_sound(snd_buttonselect,5,0) break;
			case 4: in_input=1 audio_play_sound(snd_buttonselect,5,0) break;
		}
	} else {
		rebinding_verb=string_lower(keybinds[selected]);
		audio_play_sound(snd_buttonselect,5,0)
		event_user(0);
	}
}

if !(selected) { 
	if input_check_pressed("menuleft") {
		selectedx-=1
		audio_play_sound(snd_buttonhover,5,0)
	} else if input_check_pressed("menuright") {
		selectedx+=1
		audio_play_sound(snd_buttonhover,5,0)
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