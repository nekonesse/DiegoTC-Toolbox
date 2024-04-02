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
	if !place_meeting(x,y+4,obj_box) && !place_meeting(x,y+4,obj_player){
		image_yscale=approach_val(image_yscale,1,0.066)
		goin=approach_val(goin,0,0.066)
	}
}