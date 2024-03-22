var y_diff=(y-yprevious)
	
var coll=instance_place(x,y-abs(y_diff),obj_player)
if (coll) {
	coll.y+=y_diff
}

var coll=instance_place(x,y-abs(y_diff),obj_box)
if (coll) {
	coll.y+=y_diff
}