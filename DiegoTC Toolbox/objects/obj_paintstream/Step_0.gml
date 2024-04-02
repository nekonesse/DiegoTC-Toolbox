if (obj_global.paused) {
image_speed=0;
exit
} else {
image_speed=1;
}

if (global.channel[real(channelid)]) 
active=inverted
else
active=!inverted

if (active) {

var player = instance_place(x,y,obj_player)
var box = instance_place(x,y,obj_box)

if (player) {
	if (player.color!=player.defaultcolor && color == colors.water) || (player.color!=color && color!=colors.water)
	audio_play_sound(snd_paint,3,false)
	
	if color != colors.water
	player.color=color
	else
	player.color=player.defaultcolor
}

if (box && !box.carry) {
	if (box.color!=box.defaultcolor && color == colors.water) || (box.color!=color && color!=colors.water)
	audio_play_sound(snd_paint,3,false)
	
	if color != colors.water
	box.color=color
	else
	box.color=box.defaultcolor
}
}