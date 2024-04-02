for (i=0;i<20;i+=1){
	global.channel[i+1]=0
}

if asset_has_tags(room_get_name(room),"Menu",asset_room)
{
	if !audio_is_playing(mus_mainmenu)
	{
		audio_group_stop_all(musicgroup)
		audio_play_sound(mus_mainmenu, 100,true)
	}
	pausable = 0
	paused = 0;
}

if asset_has_tags(room_get_name(room),"Special",asset_room)
{
	if !audio_is_playing(mus_nogp)
	{
		audio_group_stop_all(musicgroup)
		audio_play_sound(mus_nogp, 100,true)
	}
	pausable = 1
}

if asset_has_tags(room_get_name(room),"Pack1",asset_room)
{
	if !audio_is_playing(mus_pack1)
	{
		audio_group_stop_all(musicgroup)
		audio_play_sound(mus_pack1, 100,true)
	}
	pausable = 1
}

if asset_has_tags(room_get_name(room),"Pack2",asset_room)
{
	if !audio_is_playing(mus_pack2)
	{
		audio_group_stop_all(musicgroup)
		audio_play_sound(mus_pack2, 100,true)
	}
	pausable = 1
}

/*if room=rm_toolbox {
	cursor_sprite = -1;
	window_set_cursor(cr_none)
	pausable = 1
}