///@description Sprite Handler

if !(grounded)
{
	if (jump) && !(round(vsp) > 0) {
		sprite_index=spr_diegojump
		if image_index >= 1
		image_index=1
	}
	if round(vsp) > 0 { 
		sprite_index=spr_diegofall
		if image_index >= 3
		image_index=3
	}
} else {
	if (move!=0) {
		sprite_index=spr_diegowalk
	} else {
		sprite_index=spr_diegoidle
	}
}