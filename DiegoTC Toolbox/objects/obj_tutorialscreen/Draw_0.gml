draw_self()

draw_set_font(fnt_tutorialscreen)
draw_set_valign(fa_center)
draw_set_halign(fa_center)
draw_set_color(c_gray)
draw_text(x+sprite_width/2,y+16,mytext)
if myverb != "" {
	if is_string(input_binding_get_icon(input_binding_get(myverb))) {
	draw_text(x+sprite_width/2,y+(sprite_height/2)+14,input_binding_get_icon(input_binding_get(myverb)))
	} else
	draw_sprite_ext(input_binding_get_icon(input_binding_get(myverb)),0,x+sprite_width/2,y+(sprite_height/2)+10,2,2,0,c_white,1)
}
draw_set_color(c_white)