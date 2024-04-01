var y_diff=(y-yprevious)
	
var coll=instance_place(x,y-abs(y_diff),obj_player)
if (coll) {
	coll.y+=y_diff
	with(coll) {
		if place_meeting(x,y-1,obj_wall) 
		event_user(1);
	}
}

var coll=instance_place(x,y-abs(y_diff),obj_box)
if (coll) {
	coll.y+=y_diff
}