if (channelid) { //check if the channelid isnt 0, aka the None channel
var box = instance_place(x,y,obj_box)
var player = instance_place(x,y,obj_player)
if (color == colors.none) {
	if (player) || (box && !box.carry)
	{
		event_user(0)
	}else{   
		event_user(1)
	}
} else {
	if (player && player.color == color) || (box && !box.carry && box.color == color)
	{
		event_user(0)
	}else{   
		event_user(1)
	}
}


}

if (active) {
	image_index=approach_val(image_index,2,0.33)
} else {
	image_index=approach_val(image_index,0,0.33)
	image_index=clamp(image_index,0,2)
}