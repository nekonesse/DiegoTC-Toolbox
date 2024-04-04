if (channelid) { //check if the channelid isnt 0, aka the None channel
	var player = instance_place(x,y,obj_player)
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, obj_box, _list, false);

	var box=false;
	if _num > 0
	{
	    for (var i = 0; i < _num; ++i;)
	    {
	       if (_list[| i].color == color && !_list[| i].carry)
		   box=true;
	    }
	}

	ds_list_destroy(_list);
	
	if (color == colors.none) {
		var box = instance_place(x,y,obj_box)
		if (player) || (box && !box.carry)
		{
			event_user(0)
		}else{   
			event_user(1)
		}
	} else {
		if (player && player.color == color) || (box)
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