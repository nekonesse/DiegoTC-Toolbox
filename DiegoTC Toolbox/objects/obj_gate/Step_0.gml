if (global.channel[channelid]) {
	
	if !(inverted) {
		event_user(0);
		active = 1
	} else {
		event_user(1);
		active = 0
	}
} else {
	if !(inverted) {
		event_user(1);
		active = 0
	} else {
		event_user(0);
		active = 1
	}
}

if (active) {
	image_yscale=approach_val(image_yscale,0,0.1)
	goin=approach_val(goin,1,0.1)
} else {
	image_yscale=approach_val(image_yscale,1,0.1)
	goin=approach_val(goin,0,0.1)
	
	if place_meeting(x,y+1,obj_player) {
		with(obj_player) {
			//death = 1;
			//instance_destroy();
			//if !audio_is_playing(snd_restart) audio_play_once(snd_restart,10)
			//fadetoroom(room, 30, c_black)
			//is_recording=0;
		}
	}
}