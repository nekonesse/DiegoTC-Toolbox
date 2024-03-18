if !(carry) {
mask_index = spr_corebox;

releasebuffer=max(0,releasebuffer-1);

//Gravity
if !(grounded)
{
	vsp -= grav
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

if place_meeting(x,y-1,obj_wall) && !place_meeting(x, yprevious-1, obj_wall)
{
	audio_play_once(snd_land, 1)
}

if place_meeting(x,y-1,obj_wall)
{
    grounded = true
	launched = false
}
else
{
    grounded = false
}

var player = instance_place(x,y-16,obj_player)

if !player && place_meeting(x-2,y,obj_player) && (obj_player.kright) && !place_meeting(x+2,y,obj_wall)
{ 
	hsp = 2
}

if !player && place_meeting(x+2,y,obj_player) && (obj_player.kleft) && !place_meeting(x-2,y,obj_wall)
{ 
	hsp = -2
}


}
else {

mask_index = spr_corebox;

mask_index = spr_empty;

//Lock Onto Player
if !(carryplayer.upsidedown)
{
	x = approach_val(x,carryplayer.x+22*carryplayer.xsc,4+abs(carryplayer.hsp))
	y = approach_val(y,carryplayer.y-36,4+abs(carryplayer.vsp))
}
else
{
	x = carryplayer.x+22*carryplayer.xsc
	y = carryplayer.y+36
}

if (input_check_pressed("carry"))
{
    if instance_exists(carryplayer) && !collision_rectangle(x+16*carryplayer.xsc,y-18,x+26*carryplayer.xsc,y+18,obj_mainsolid,false,true) {
		    if !(carryplayer.dropbuffer > 0) 
		    {
				carry = 0
				carryplayer.carryid = undefined
				carryplayer.carrying = 0
				releasebuffer = 5
				
				if (carryplayer.kup) {
					y -= 10
					x -= 22*carryplayer.xsc
					
					hsp = carryplayer.hsp
				    vsp = -9
				} else if (carryplayer.kdown) {
					x += 14*carryplayer.xsc
					
					hsp = carryplayer.hsp
					vsp=1
				} else {
					x += 10*carryplayer.xsc
				
					hsp = 9*carryplayer.xsc
				    vsp = -2
				}
			}
	}

}

}