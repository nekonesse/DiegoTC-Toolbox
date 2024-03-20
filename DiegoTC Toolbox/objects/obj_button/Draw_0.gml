if color == colors.none {
	sprite_index=spr_button
	draw_self();
} else {
	sprite_index=spr_colorbutton
	pal_swap_set(spr_paintpal,color,false);
	draw_self();
	pal_swap_reset();
}