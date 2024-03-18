/// @description Main

/*if !(obj_global.paused)
{

*/if input_check_pressed("restart",0,0) && !(obj_global.paused)
{
	if !audio_is_playing(snd_restart) audio_play_once(snd_restart,10)
	TransitionStart(room,sqRoomFadeOut,sqRoomFadeIn)
	is_recording=0;
}
/*
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

if (alarm[0] > 0) && (place_meeting(x + 1, y, obj_wall) || place_meeting(x - 1, y, obj_wall))
{
	wallbuffer = 1;
	alarm[0] = 0;
}
	
/*if checkcol(obj_ice,false,false,false,true)
{
	fric = 0.01
}
else if checkcol(obj_wall,false,false,false,true) || checkcol(obj_grate,false,false,false,true)
{
	fric = .3;
}*/

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
if place_meeting(round(x)+hsp_final,round(y),[obj_wall, obj_grate])
{
	while !place_meeting(round(x)+sign(hsp_final),round(y),[obj_wall, obj_grate])
	{
		x += sign(hsp_final);
	}
	hsp_final = 0;
}
x += hsp_final;

if place_meeting(round(x),round(y)+vsp,[obj_wall, obj_grate])
{
	while !place_meeting(round(x),round(y)+sign(vsp),[obj_wall, obj_grate])
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

if (move != 0)
{
	if !(carrying) {
	//wall sliding
	var coll=collision_rectangle(x+(16*xsc),y-(38*ysc),x+(20*xsc),y-(34*ysc),obj_wall,false,true)
	if (!grounded) && (coll && coll.object_index!=obj_box && object_get_parent(coll.object_index)!=obj_box) && place_meeting(x+1*xsc,y,obj_wall) && (vsp > 0) && !(move_lock) {
		vsp=min(vsp,1.125);
		sliding=true;
	} else {
		if (sliding) xsc=-xsc;
		sliding=false;
	}
	}
	
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
	if (sliding) xsc=-xsc;
	sliding=false;
}

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

//Jumping
if ((canjump > 0 && (kjump)) || (bufferjump) || (inwater == true && (kjump)) ) && !(launched) //&& !place_meeting(x,y+2,obj_launcher)
{
	audio_play_once(snd_jump, 1)
	bufferjump = 0;
	vsp = -jumpspeed;
	canjump = 0;
	jump = true;
	xstretch=0.75;
	ystretch=1.25;
}

if (kjump) && grounded == false && !(sliding)
{
	alarm[0] = 10;
}
else if grounded == true
{
	if (alarm[0] > 0) {
		bufferjump = 1;
	}
	alarm[0] = 0;
	wallbuffer = 0;
}

//Wall Slide Particles

if (sliding) {
	slidingtimer-=1
	//create particles when timer reaches 0
	if (!slidingtimer) {
		//sliding variable already checks if the upper hand is colliding so no need to double check
		instance_create_depth(x+16*xsc,y-32*ysc,5,obj_dustparticle)
		//check collision with bottom foot
		if collision_rectangle(x+(16*xsc),y,x+(20*xsc),y+4*ysc,obj_wall,false,true) {
			instance_create_depth(x+16*xsc,y-4*ysc,5,obj_dustparticle) 
		}
	}
	//reset timer back to 10
	slidingtimer=wrap_val(slidingtimer,0,10)
} else slidingtimer=10

//Carry Box

var box=instance_place(x+2*xsc,y,obj_box)
if (kcarry) && (carryid==undefined) && (box) && (box.image_xscale==1) && (box.image_yscale==1) && !(box.releasebuffer){
	carryid=box
	box.carryplayer=id
	box.carry=1
	carrying=1
}

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
coll=instance_place(x+move, y, obj_wall)
if (move!=0) && ((kjump) || wallbuffer == 1) && (coll && coll.object_index!=obj_box) && (!grounded) && (!inwater)
{
    sliding=false;
	audio_play_once(snd_jump, 1);
	jump=true;
    wallbuffer = 0;
    bufferjump = 0;
    vsp=-jumpspeed;
    move=-move;
	xsc=-xsc;
    move_lock = true
	image_index=0;
	alarm[1]=15;
	alarm[0]=0;
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

xstretch = lerp(xstretch,1, .15);
ystretch = lerp(ystretch,1, .15);

if !(move_lock) {
	if (kleft) 
	xsc=-1;
	else if (kright)
	xsc=1;
}

event_user(0);

x=round(x);
y=round(y);

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

if keyboard_check_pressed(ord("Q")) color-=1
if keyboard_check_pressed(ord("E")) color+=1