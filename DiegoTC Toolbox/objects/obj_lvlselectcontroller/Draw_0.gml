draw_set_font(fnt_main)
for (var dy=0; dy<3; dy++) {
	for (var dx=0; dx<5; dx++) {
		draw_sprite(spr_levelbutton,0,x+(96*dx),y+(96*dy))
		
		
		draw_set_color($46353e)
		draw_text(x+(96*dx),y+(96*dy)+2,string(lvl[dx,dy]))
		draw_text(x+(96*dx),y+(96*dy)+3,string(lvl[dx,dy]))
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color($1796f7)
		draw_text(x+(96*dx),y+(96*dy)+1,string(lvl[dx,dy]))
		draw_set_color($2bc2f9)
		draw_text(x+(96*dx),y+(96*dy),string(lvl[dx,dy]))
		
		if (curs_x == dx) && (curs_y == dy) {
			draw_sprite(spr_levelbutton,2,x+(96*dx),y+(96*dy))
		}
	}
}
draw_set_color(c_white)