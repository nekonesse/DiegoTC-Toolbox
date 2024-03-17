if (channelid) != 0
{
	var player = instance_place(x,y,obj_player)
	if (player != noone && (!(player.carrying) || player.upsidedown)) {
		if (player.color == color)
			event_user(0);
		else
			event_user(1);
	}
	
	var box = instance_place(x,y,obj_box)
	if (box != noone) {
		if (box.color == color)
			event_user(0);
		else
			event_user(1);
	}
}