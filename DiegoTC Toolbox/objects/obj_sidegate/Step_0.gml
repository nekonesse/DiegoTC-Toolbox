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
	image_xscale=approach_val(image_xscale,0,0.1)
	goin=approach_val(goin,1,0.1)
} else {
	if !place_meeting(x+4,y,obj_box) && !place_meeting(x+4,y,obj_player){
		image_xscale=approach_val(image_xscale,1,0.066)
		goin=approach_val(goin,0,0.066)
	}
	
	if place_meeting(x+1,y,obj_player) {
		with(instance_place(x+1,y,obj_player)) {
			//death = 1;
			//instance_destroy();
			//if !audio_is_playing(snd_restart) audio_play_once(snd_restart,10)
			//fadetoroom(room, 30, c_black)
			//is_recording=0;
		}
	}
}