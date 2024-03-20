if (global.channel[real(channelid)]) 
active=inverted
else
active=!inverted


var player = instance_place(x,y,obj_player)
var box = instance_place(x,y,obj_box)

if (player) {
	if player.color!=player.defaultcolor
	audio_play_once(snd_paint,3)
	
	if color != colors.water
	player.color=color
	else
	player.color=player.defaultcolor
}

if (box) {
	if box.color!=box.defaultcolor
	audio_play_once(snd_paint,3)
	
	if color != colors.water
	box.color=color
	else
	box.color=box.defaultcolor
}