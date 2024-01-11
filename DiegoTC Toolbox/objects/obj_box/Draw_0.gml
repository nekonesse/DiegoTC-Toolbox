draw_self();

if (carry) && instance_exists(carryplayer) {
	draw_sprite_ext(spr_diegoholdinghand,0,x,y+17,carryplayer.xsc,carryplayer.ysc,0,c_white,1)
}