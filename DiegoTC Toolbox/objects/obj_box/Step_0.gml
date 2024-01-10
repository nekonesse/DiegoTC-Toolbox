//Gravity
if (vsp < 0) && (!kjumpheld) && realjump == 0
{
	vsp += grav
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
}

if place_meeting(x+hsp_final,y,obj_grate)
{
	while !place_meeting(x+sign(hsp_final),y,obj_grate)
	{
		x += sign(hsp_final);
	}
	hsp_final = 0;
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

if place_meeting(x,y+vsp,obj_grate)
{
	while !place_meeting(x,y+sign(vsp),obj_grate)
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

if place_meeting(x,y+1,obj_wall) && !place_meeting(x, yprevious+1, obj_wall)
{
	audio_play_once(snd_land, 1)
	xstretch=1.25;
	ystretch=0.75;
}

if place_meeting(x,y+1,obj_grate) && !place_meeting(x, yprevious+1, obj_grate)
{
	audio_play_once(snd_land, 1)
	xstretch=1.25;
	ystretch=0.75;
}

if place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,obj_grate)
{
    grounded = true
	launched = false
	realjump = 0;
	jump = false;
}
else
{
    grounded = false
}