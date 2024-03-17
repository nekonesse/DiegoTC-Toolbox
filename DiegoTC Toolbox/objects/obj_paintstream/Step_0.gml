if (global.channel[real(channelid)]) 
active=inverted
else
active=!inverted


var player = instance_place(x,y,obj_player)

if (player) {
	if color != colors.water
	player.color=color
	else
	player.color=player.defaultcolor
}