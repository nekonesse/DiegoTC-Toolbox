if (channelid) { //check if the channelid isnt 0, aka the None channel

var coll = instance_place(x,y,obj_box)
if place_meeting(x,y,obj_player) || (coll && !coll.carry)
{
	event_user(0)
}else{   
	event_user(1)
}


}

if (active) {
	image_index=approach_val(image_index,2,0.33)
} else {
	image_index=approach_val(image_index,0,0.33)
	image_index=clamp(image_index,0,2)
}