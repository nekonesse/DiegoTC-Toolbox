pal_swap_set(spr_boxpal,color,false)
draw_self();
pal_swap_reset()

if !(minecartcarry) && (carry) && instance_exists(carryplayer) {
	pal_swap_set(spr_diegopal,carryplayer.color,false)
	draw_sprite_ext(spr_diegoholdinghand,0,x,y+17,carryplayer.xsc,carryplayer.ysc,0,c_white,1)
	pal_swap_reset()
}

draw_set_alpha(0.5)
draw_rectangle(x-16,y-16-12,x+16,y+16,false)
draw_set_alpha(1)