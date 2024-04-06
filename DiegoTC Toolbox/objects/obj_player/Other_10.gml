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
		if !(carrying) {
			if (kup)
			sprite_index=spr_diegolookupwalk
			else
			sprite_index=spr_diegowalk
		}
		else {
			if (kup)
			sprite_index=spr_diegolookupholdwalk
			else
			sprite_index=spr_diegowalkhold
		}
	} else {
		if !(carrying) {
			if (kup) {
				if sprite_index!=spr_diegolookupidle && sprite_index!=spr_diegolookupwalk && sprite_index!=spr_diegolookupholdidle && sprite_index!=spr_diegolookupholdwalk
				image_index=0;
				
				sprite_index=spr_diegolookupidle
				if image_index > 6
				image_index=2
			}
			else
			sprite_index=spr_diegoidle
		}
		else {
			if (kup) {
				if sprite_index!=spr_diegolookupholdidle && sprite_index!=spr_diegolookupholdwalk && sprite_index!=spr_diegolookupholdidle && sprite_index!=spr_diegolookupholdwalk
				image_index=0;
				
				sprite_index=spr_diegolookupholdidle
				if image_index > 6
				image_index=2
			}
			else
			sprite_index=spr_diegoidlehold
		}
	}
}