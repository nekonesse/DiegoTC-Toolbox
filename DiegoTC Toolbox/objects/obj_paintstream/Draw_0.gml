anim=wrap_val(anim,0,7);
anim+=0.2

if (active) {
	pal_swap_set(spr_paintpal,color,false)
	draw_sprite_ext(spr_paintstream,floor(anim),x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	pal_swap_reset();
}

draw_self();