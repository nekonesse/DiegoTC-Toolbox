pal_swap_set(spr_boxpal,color,false)
draw_self();
pal_swap_reset()

if !(minecartcarry) && (carry) && instance_exists(carryplayer) {
	pal_swap_set(spr_diegopal,carryplayer.color,false)
	draw_sprite_ext(spr_diegoholdinghand,0,x,y+17,carryplayer.xsc,carryplayer.ysc,0,c_white,1)
	pal_swap_reset()
	draw_rectangle(carryplayer.x-8,carryplayer.y-20,carryplayer.x+8,carryplayer.y-12,false)
	draw_text(x,y,collision_rectangle(carryplayer.x-8,carryplayer.y-20,carryplayer.x+8,carryplayer.y-12,id,false,false))
}