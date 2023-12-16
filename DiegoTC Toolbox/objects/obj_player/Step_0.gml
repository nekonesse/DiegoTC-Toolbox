/// @description Main

/*if !(obj_global.paused)
{

if input_check_pressed("restart",0,0) && !(obj_global.paused)
{
	if !audio_is_playing(snd_restart) audio_play_once(snd_restart,10)
	fadetoroom(room, 30, c_black)
	is_recording=0;
}

if place_meeting(x,y,obj_spike) && death = 0
{
	death = 1;
	instance_destroy();
	if !audio_is_playing(snd_restart) audio_play_once(snd_restart,10)
	fadetoroom(room, 30, c_black)
	is_recording=0;
}

if place_meeting(x,y,obj_wall) && !place_meeting(x,y,obj_box)
{
	death = 1;
	instance_destroy();
	if !audio_is_playing(snd_restart) audio_play_once(snd_restart,10)
	fadetoroom(room, 30, c_black)
	is_recording=0;
}

if place_meeting(x,y,obj_antigrav)
{
	antigrav = true;
	grav = 0
}
else
{
	antigrav = false;
}*/

/*if place_meeting(x,y,obj_water) 
{
	inwater = true;
	if object_index!=obj_soaker
	{
		if color != defaultcolor
		{
			audio_play_once(snd_paint,2);
		}
		color = defaultcolor
	} else {
		if color != colors.none
		{
			audio_play_once(snd_paint,2);
		}
		color = colors.none
	}	
	jumpspeed = 9
	grav = 0.2
}
else
{
	jumpspeed = 14;
	inwater = false;
}*/

/*if antigrav == false && inwater == false
{
	grav = defaultgrav
}*/

canjump = clamp(canjump,0,10)

if !(move_lock)
{
    move = -kleft + kright
}

if (alarm[0] > 0) && (place_meeting(x + 1, y, obj_wall) || place_meeting(x - 1, y, obj_wall) )
{
	wallbuffer = 1;
	alarm[0] = 0;
}

if (move != 0)
{
	
	if !grounded && fric == 0.01 && (move != sign(hsp_final))
	{
		fric = .3;
	}
	hsp += move*accel

	hsp = clamp(hsp,-max_hsp,max_hsp)
}
else
{
	hsp = lerp(hsp,0,fric)
}
	
/*if checkcol(obj_ice,false,false,false,true)
{
	fric = 0.01
}
else if checkcol(obj_wall,false,false,false,true) || checkcol(obj_grate,false,false,false,true)
{
	fric = .3;
}*/

if (kjump) && grounded == false
{
	alarm[0] = 10;
}
else if grounded == true
{
	alarm[0] = 0;
	wallbuffer = 0;
}

if (alarm[0] > 0) && grounded == true
{
	bufferjump = 1;
	alarm[0] = 0;
}

if !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,obj_grate)
{
	vsp += grav;
	canjump -= 1
}
else
{
	canjump = 10
}

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
	jump = 0;
}
else
{
    grounded = false
}

//Jumping
if ( (canjump > 0 && (kjump)) || bufferjump == 1 || (inwater == true && (kjump)) ) && !(launched) //&& !place_meeting(x,y+2,obj_launcher)
{
	audio_play_once(snd_jump, 1)
	bufferjump = 0;
	vsp = -jumpspeed;
	canjump = 0;
	jump = 1;
	xstretch=0.75;
	ystretch=1.25;
}

xstretch = lerp(xstretch,1, .15);
ystretch = lerp(ystretch,1, .15);

//Switch Gravity pt 2
/*if place_meeting(x,y,obj_bluediamond) && (alarm[1] > 0)
{
	alarm[1] = 0
	upside = directionstates.updown
	y = instance_place(x,y,obj_bluediamond).y
	audio_play_once(snd_flip, 1)
}

//RELEASE BUFFER
if (input_check_released("down",0,0))
{
dropbuffer=10;
}*/

//Jump On Cannonball
/*if place_meeting(x,y+2,obj_cannonball)
{
	vsp = -jumpspeed
}

//Climb Ladder
if place_meeting(x,y,obj_ladder) && (kup)
{
	vsp = -jumpspeed/2
}*/

//Wall Jump
if ((kjump) || wallbuffer == 1) && place_meeting(x + 1, y, obj_wall) && grounded = false && inwater = false
{
    audio_play_once(snd_jump, 1)
    wallbuffer = 0;
    bufferjump = 0;
    vsp = -jumpspeed;
    xscale = .5
    yscale = 1.5
    xskew = 0
    move = -1
    move_lock = true
	alarm[1]=15;
}

if ((kjump) || wallbuffer == 1) && place_meeting(x - 1, y, obj_wall) && grounded = false && inwater = false
{
    audio_play_once(snd_jump, 1)
    wallbuffer = 0;
    bufferjump = 0;
    vsp = -jumpspeed;
    xscale = .5
    yscale = 1.5
    xskew = 0
    move = 1
    move_lock = true
	alarm[1]=15;
}
/*
if (has_winder) {
	
	if input_check_pressed("record",0,0)
	{	
		if !(is_recording)
		{
			ds_list_clear(xpos);
			ds_list_clear(ypos);
			ds_list_clear(xscalelist);
			ds_list_clear(yscalelist);
			ds_list_clear(xsclist);
			ds_list_clear(xskewlist);
			ds_list_clear(spritelist);
		}
		
		if instance_exists(obj_winded) instance_destroy(obj_winded);
		playback=false;
		
		is_recording=!is_recording;
		recordtimer=600;
	}
	
	if (is_recording) && (recordtimer)
	{
		if ds_exists(xpos,ds_type_list) ds_list_add(xpos,x);
		if ds_exists(ypos,ds_type_list) ds_list_add(ypos,y);
		if ds_exists(xscalelist,ds_type_list) ds_list_add(xscalelist,xscale);
		if ds_exists(yscalelist,ds_type_list) ds_list_add(yscalelist,yscale);
		if ds_exists(xsclist,ds_type_list) ds_list_add(xsclist,xsc);
		if ds_exists(xskewlist,ds_type_list) ds_list_add(xskewlist,xskew);
		if ds_exists(spritelist,ds_type_list) ds_list_add(spritelist,mysprite);
		
		recordtimer -= 1;
	}
	
	if recordtimer <= 0 && !(playback)
	{
		is_recording=false;
		instance_create_depth(ds_list_find_value(xpos,0),ds_list_find_value(ypos,0),0,obj_winded)
		playback=true;
	}

	if input_check_pressed("recordplay") && !(is_recording) && !(playback) && ds_list_size(xpos) > 0
	{
		instance_create_depth(real(ds_list_find_value(xpos,0)),real(ds_list_find_value(ypos,0)),0,obj_winded)
		playback=true;
	}
}*/


//Color Sprite Switch
/*switch color 
{
case colors.yellow: image_index = 0 break;
case colors.blue: image_index = 1 break;
case colors.red: image_index = 2 break; 
case colors.orange: image_index = 3 break;
case colors.green: image_index = 4 break;
case colors.purple: image_index = 5 break;
case colors.white: image_index = 6 break;
case colors.gray: image_index = 7 break;
case colors.none: image_index = 8 break;
}*/

if (kleft)
xsc=-1;
else if (kright)
xsc=1;

event_user(0)

x=round(x)
y=round(y)

///Camera Movement

/*hdist = 0
vdist = 64;
cam.xto = x + hdist
cam.yto = y + vdist
camspd = 30;

cam.xto = x + hdist;
cam.yto = y + vdist;

cam.x += (cam.xto-cam.x)/camspd
cam.y += (cam.yto-cam.y)/camspd
*/