w=room_width/2
h=(room_height/2)-64
draw_set_font(fnt_main)

if (paused) {
	draw_set_alpha(0.5)
	draw_rectangle_color(0,0,960,540,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1)

	for(var i=0; i < array_length(menus); i++) {
		if selected == i
		draw_text_color(w,(h-48)+96*i,"> "+menus[i]+" <",c_white,c_white,c_gray,c_gray,1)
		else
		draw_text_color(w,(h-48)+96*i,menus[i],c_white,c_white,c_gray,c_gray,1)
	}
	draw_text_color(w,h+96,string(round(obj_global.soundvol*100))+"%",c_white,c_white,c_gray,c_gray,1)
	
	draw_text_color(w,h+96*2,string(round(obj_global.musicvol*100))+"%",c_white,c_white,c_gray,c_gray,1)
}