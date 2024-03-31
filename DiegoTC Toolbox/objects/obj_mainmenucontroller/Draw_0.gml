draw_set_font(fnt_main)
draw_set_valign(fa_center)
draw_set_halign(fa_left)
for(var i=0; i < array_length(menus); i++) {
	var wavy = 0;
	//button
	draw_sprite_ext(spr_menubutton,0,34,36+(80*i),1+(string_width(menus[i])/64),1,0,c_black,0.5) //shadow
	draw_sprite_ext(spr_menubutton,0,32,32+(80*i),1+(string_width(menus[i])/64),1,0,c_white,1)
	
	//text
	draw_set_color($46353e)
	draw_text(49,67+(80*i),menus[i])
	draw_text(49,66+(80*i),menus[i])
	draw_set_color($1796f7)
	draw_text(48,65+(80*i),menus[i])
	draw_set_color($2bc2f9)
	draw_text(48,64+(80*i),menus[i])
	
	if (selected == i) {
		wavy=wave_val(0,8,1,0)
		//cursor
		draw_sprite_ext(spr_menucursor,0,82+(string_width(menus[i]))+wavy,34+(80*i),1,1,0,c_black,0.5)//shadow
		draw_sprite(spr_menucursor,0,80+(string_width(menus[i]))+wavy,32+(80*i))	
		
		//button outline
		draw_sprite_ext(spr_menubutton,1,32,32+(80*i),1+(string_width(menus[i])/64),1,0,c_white,1)
	}
}
draw_set_color(c_white)