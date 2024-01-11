if !(carry) {
mask_index = spr_box;

//Gravity
if !(grounded)
{
	vsp += grav
} else {
	hsp = lerp(hsp,0,fric)
}

hsp_final = hsp + hsp_carry
hsp_carry = 0;

//Collision
if place_meeting(x+hsp_final,y,obj_wall)
{
	while !place_meeting(x+sign(hsp_final),y,obj_wall)
	{
		x += sign(hsp_final);
	}
	hsp_final = 0;
	hsp = 0;
}
x += hsp_final;

if place_meeting(x,y+vsp,obj_wall)
{
	while !place_meeting(x,y+sign(vsp),obj_wall)
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

if place_meeting(x,y+1,obj_wall) && !place_meeting(x, yprevious+1, obj_wall)
{
	audio_play_once(snd_land, 1)
}

if place_meeting(x,y+1,obj_grate) && !place_meeting(x, yprevious+1, obj_grate)
{
	audio_play_once(snd_land, 1)
}

if place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,obj_grate)
{
    grounded = true
	launched = false
}
else
{
    grounded = false
}

var player = instance_place(x,y-16,obj_player)

if !player && place_meeting(x-2,y,obj_player) && (obj_player.kright)
{
	if !place_meeting(x+2,y,obj_wall)
	{
	hsp = 2
	}
}

if !player && place_meeting(x+2,y,obj_player) && (obj_player.kleft)
{
	if !place_meeting(x-2,y,obj_wall)
	{
	hsp = -2
	}
}


}
else {

mask_index = spr_box;

mask_index = spr_empty;

//Lock Onto Player
if !(carryplayer.upsidedown)
{
x = carryplayer.x+22*carryplayer.xsc
y = carryplayer.y-36
}
else
{
x = carryplayer.x+22*carryplayer.xsc
y = carryplayer.y+36
}

if (input_check_released("carry"))
{
    if instance_exists(carryplayer) && !collision_rectangle(x+16*carryplayer.xsc,y-18,x+26*carryplayer.xsc,y+18,obj_mainsolid,false,true) {
		    if !(carryplayer.dropbuffer > 0) 
		    {
			    carry = 0
				carryplayer.carryid=undefined
				carryplayer.carrying=0
				
				x += 10*carryplayer.xsc
				
				hsp = 8*carryplayer.xsc
			    vsp = -2
			}
	}

}

}