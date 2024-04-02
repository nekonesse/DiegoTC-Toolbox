if (obj_global.paused) {
image_speed=0;
exit
} else {
image_speed=1;
}


if (channelid) != 0
{
	var player = instance_place(x,y,obj_player)
	var box = instance_place(x,y,obj_box)
	if (box != noone) && !(donotcheck) {
		if (box.color == color) {
			event_user(0);
			donotcheck=true;
		} else {
			event_user(1);
		}
	}
	
	if (player != noone) && (!(player.carrying) || player.upsidedown) && !(donotcheck) {
		if (player.color == color){
			event_user(0);
		} else {
			event_user(1);
		}
	}
	
}

var _list = ds_list_create();
var _num = instance_place_list(x, y, obj_box, _list, false);

var halt=false;
if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
       if (_list[| i].color == color)
	   halt=true;
    }
}

ds_list_destroy(_list);

if !(halt) {
	donotcheck=false
}