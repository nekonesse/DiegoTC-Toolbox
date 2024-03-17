draw_sprite_stretched(spr_boxmuncherbar,0,x-64,y-height-48,128,height+48);

pal_swap_set(spr_paintpal,color,false);
draw_self();
pal_swap_reset();
draw_sprite(spr_boxmuncherhead,0,x,y-height-16);

var eyeposy=y-height-56
var eyeposx=x-32

if instance_exists(obj_box) {
var eyetargetx=lengthdir_x(24,point_direction(eyeposx,eyeposy,instance_nearest(x,y,obj_box).x,instance_nearest(x,y,obj_box).y))
var eyetargety=lengthdir_y(12,point_direction(eyeposx,eyeposy,instance_nearest(x,y,obj_box).x,instance_nearest(x,y,obj_box).y))
} else {
var eyetargetx=0
var eyetargety=0
}

if (releasedelay == 30) {
eyedestx=approach_val(eyedestx,eyetargetx,0.5)
eyedesty=approach_val(eyedesty,eyetargety,0.5)
}

draw_sprite(
	spr_boxmunchereye,0,
	eyeposx+median(-12,floor(eyedestx),12),
	eyeposy+median(-5,floor(eyedesty),5)
);

var eyeposx=x+32

draw_sprite(
	spr_boxmunchereye,0,
	eyeposx+median(-12,eyedestx,12),
	eyeposy+median(-5,eyedesty,5)
);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_small);
draw_text(x,y+16,string(counter)+"/"+string(target))