if (obj_global.paused) exit;

if !(carry) {
mask_index = spr_box;

releasebuffer=max(0,releasebuffer-1);

//Gravity
if !(grounded)
{
	vsp += grav
} else {
	hsp = lerp(hsp,0,fric)
}

var player = instance_place(x,y-16,obj_player)

if !player && place_meeting(x-2,y,obj_player) && (obj_player.kright) && !(releasebuffer)
{ 
	hsp = 2
}

if !player && place_meeting(x+2,y,obj_player) && (obj_player.kleft) && !(releasebuffer)
{ 
	hsp = -2
}

var x_diff = (x - xprevious);
var y_diff = (y - yprevious);

var player = instance_place(x,y-4,obj_player)
if (player)
{
	player.hsp_carry = hsp_final;
}

var box = instance_place(x,y-4,obj_box)
if (box && !box.carry)
{
	box.hsp_carry = hsp_final;
	box.y += y_diff;
}

hsp_final = hsp + hsp_carry
hsp_carry = 0;

coll=instance_place(x,y,obj_wall) 
if (coll && coll.object_index != obj_player) { //ANTI CLIPPING
	if distance_to_point(coll.bbox_left,coll.y) > distance_to_point(coll.bbox_right,coll.y) 
	x++;
	else
	x--;
	
	var _fakehsp = x-xprevious;
	
	player=instance_place(x+_fakehsp,y,obj_player)
	if (player) {
		player.x+=_fakehsp;
	}
}

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

if place_meeting(x,y+1,obj_wall)
{
    grounded = true
	launched = false
}
else
{
    grounded = false
}

y=round(y)
}
else {

mask_index = spr_box;

//haha funny variable name
var pstream = instance_place(x,y,obj_paintstream)
var pdetector = instance_place(x,y,obj_paintdetector)
var coll = instance_place(x,y,[obj_wall, obj_grate])

//Get Painted in carry mode
if (pstream && pstream.active) && (!coll || coll.object_index == obj_player)
{
    if (color!=defaultcolor && pstream.color == colors.water) || (color!=pstream.color && pstream.color!=colors.water)
	audio_play_once(snd_paint,3)
	
	if pstream.color != colors.water
	color=pstream.color
	else
	color=defaultcolor
}

//Active Paint Detectors in carry mode
if (pdetector) && (!carryplayer.upsidedown || pdetector.image_angle==180) && (!coll || coll.object_index == obj_player)
{
	with(pdetector) {
		if (channelid != 0) && !(donotcheck)
		{
			if (other.color == color)
				event_user(0);
			else
				event_user(1);
		}
	}
}

if !collision_rectangle(carryplayer.x-3,carryplayer.bbox_bottom,carryplayer.x+3,carryplayer.bbox_top,id,false,false) {
	throwable=true;
} else {
	throwable=false;
}

mask_index = spr_empty;

//Lock Onto Player
if !(minecartcarry) {
hsp=0
vsp=0
	
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

var _list = ds_list_create();
	
if (carryplayer.kup)
coll=collision_rectangle_list(x-16,y-16-(12 + (-carryplayer.vsp)),x+16,y+16,obj_wall,false,true,_list,true)
else
coll=collision_rectangle_list(x-16*carryplayer.xsc,y-18,x+26*carryplayer.xsc,y+18,obj_wall,false,true,_list,true)

halt=false;
if coll > 0
{
	for (var i = 0; i < coll; ++i;)
	{
	    if (_list[| i].object_index == obj_wall || (object_is_ancestor(_list[| i].object_index, obj_wall) && _list[| i].object_index != obj_player)) 
		halt=true;
	}
}
ds_list_destroy(_list);

if (input_check_pressed("carry")) && (throwable) && (!halt)
{
	
    if instance_exists(carryplayer) {
		if !(carryplayer.dropbuffer > 0) 
		{		
			if (carryplayer.kup) {
				y -= (12 + (-carryplayer.vsp))
					
				hsp = carryplayer.hsp
				vsp = -9
			} else if (carryplayer.kdown) {
				x += (10*carryplayer.xsc)+(carryplayer.hsp)
					
				hsp = carryplayer.hsp
				vsp=1
			} else {
				coll=collision_rectangle(x-16*carryplayer.xsc,y-18,x+(26*carryplayer.xsc)+(carryplayer.hsp+2*carryplayer.xsc),y+18,obj_wall,false,true)
				if (!coll && coll.object_index!=obj_player) {
					x += (10*carryplayer.xsc)
				}
				else {
					x += (10*carryplayer.xsc)+(carryplayer.hsp)
					hsp = 10*carryplayer.xsc
				}
				vsp = -2
			}
		}
	}
	
	carry = 0
	carryplayer.carryid = undefined
	carryplayer.carrying = 0
	releasebuffer = 5

}
} else {
//MINECART CARRYING BEHAVIOR
mask_index = spr_box;
x = approach_val(x,minecartcarry.x,4+abs(minecartcarry.hsp))
y = approach_val(y,minecartcarry.y-16,4+abs(minecartcarry.vsp))

if (carryplayer) {
carryplayer.carryid = undefined
carryplayer.carrying = 0
carryplayer=undefined;
}

var x_diff = (x - xprevious);
var y_diff = (y - yprevious);

var player = instance_place(x,y-4,obj_player)
if (player)
{
	var collider=collision_rectangle((player.x)*sign(x_diff),player.bbox_bottom-1,(player.x)+(x_diff)*sign(x_diff),player.bbox_top+1,obj_wall,false,true)
	if !(collider) {
		player.x += x_diff;
		player.y += y_diff;
	}
	
}

var box = instance_place(x,y-4,obj_box)
if (box)
{
	var collider=collision_rectangle((box.x)*sign(x_diff),box.bbox_bottom-1,(box.x)+(x_diff)*sign(x_diff),box.bbox_top+1,obj_wall,false,true)
	if !(collider) {
		box.x += x_diff;
		box.y += y_diff;
	}
	
}

}

}