draw_set_font(fnt_main)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
var w=(room_width/4)-32
var h=(room_height/4)-16

///what the hell even is this anymore
if (!in_input) {
	for(var i=0; i < array_length(menus); i++) {
		if selected == i
		draw_text_color(w,(h-48)+96*i,"> "+menus[i]+" <",c_white,c_white,c_gray,c_gray,1)
		else
		draw_text_color(w,(h-48)+96*i,menus[i],c_dkgray,c_dkgray,c_black,c_black,1)
	}
	
	for(var i=0; i < array_length(resolutions); i++) {
		if selectedx == i
		draw_text_color((w-96)+96*i,h,"> "+resolutions[i]+" <",c_white,c_white,c_gray,c_gray,1)
		else
		draw_text_color((w-96)+96*i,h,resolutions[i],c_dkgray,c_dkgray,c_black,c_black,1)
	}
	
	draw_text_color(w,h+96,string(round(obj_global.soundvol*100))+"%",c_white,c_white,c_gray,c_gray,1)
	
	draw_text_color(w,h+96*2,string(round(obj_global.musicvol*100))+"%",c_white,c_white,c_gray,c_gray,1)
	
	if (obj_global.vsync) {
		draw_text_color(w,h+96*3,"On",c_white,c_white,c_gray,c_gray,1)
	} else {
		draw_text_color(w,h+96*3,"Off",c_dkgray,c_dkgray,c_black,c_black,1)
	}	
} else {
	for(var i=0; i < array_length(keybinds); i++) {
		if (string_lower(keybinds[i]) == rebinding_verb) {
			draw_text_color(w-64,(h-48)+48*i,"> "+keybinds[i]+" <",c_white,c_white,c_gray,c_gray,1)
		} else if selected == i {
			draw_text_color(w-64,(h-48)+48*i,"> "+keybinds[i]+" <",c_dkgray,c_dkgray,c_black,c_black,1)	
		} else {
			draw_text_color(w-64,(h-48)+48*i,keybinds[i],c_dkgray,c_dkgray,c_black,c_black,1)
		}
		draw_set_halign(fa_left)
		if is_string(input_binding_get_icon(input_binding_get((string_lower(keybinds[i]))))) {
			draw_text_color(w+32,(h-48)+48*i,input_binding_get_icon(input_binding_get(string_lower(keybinds[i]))),c_white,c_white,c_gray,c_gray,1)
		} else {
			draw_sprite_ext(input_binding_get_icon(input_binding_get((string_lower(keybinds[i])))),0,w+48,(h-50)+48*i,3,3,0,c_white,1)
		}
		draw_set_halign(fa_center)
	}
}


draw_set_color(c_white)