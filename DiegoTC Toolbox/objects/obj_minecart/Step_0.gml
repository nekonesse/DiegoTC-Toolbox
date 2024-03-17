if place_meeting(round(x)+hsp,round(y),[obj_wall, obj_grate])
{
	while !place_meeting(round(x)+sign(hsp),round(y),[obj_wall, obj_grate])
	{
		x += sign(hsp);
	}
	hsp = -hsp;
}
x += hsp;

if place_meeting(round(x),round(y)+vsp,[obj_wall, obj_grate])
{
	while !place_meeting(round(x),round(y)+sign(vsp),[obj_wall, obj_grate])
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

var box = collision_rectangle(x-16,y-20,x+16,y,obj_box,false,true);
if (box) && !box.carry {
	box.carry=1;
	box.minecartcarry=id;
}

var x_diff = (x - xprevious);
var y_diff = (y - yprevious);

var player = instance_place(x,y-4,obj_player)
if (player)
{
	player.x += x_diff;
	player.y += y_diff;
	
}


if !collision_rectangle(x+16*sign(hsp),y,x+24*sign(hsp),y+16,obj_rail,false,true) {
	hsp=-hsp;
	flipped=1
} else {
	flipped=0
}
