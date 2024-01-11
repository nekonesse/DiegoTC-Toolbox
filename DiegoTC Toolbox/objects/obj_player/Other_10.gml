///@description Sprite Handler

if !(grounded)
{
	if !(sliding) {
		if (jump) && !(round(vsp) > 0) {
			if !(carrying)
			sprite_index=spr_diegojump
			else
			sprite_index=spr_diegojumphold
			if image_index >= 1
			image_index=1
		}
		if round(vsp) > 0 { 
			if !(carrying)
			sprite_index=spr_diegofall
			else
			sprite_index=spr_diegofallhold
			if image_index >= 3
			image_index=3
		}
	} else {
		sprite_index=spr_diegowallslide
	}
} else {
	if (move!=0) {
		if !(carrying)
		sprite_index=spr_diegowalk
		else
		sprite_index=spr_diegowalkhold
	} else {
		if !(carrying)
		sprite_index=spr_diegoidle
		else
		sprite_index=spr_diegoidlehold
	}
}