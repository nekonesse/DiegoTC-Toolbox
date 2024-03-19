coll=instance_place(x,y-1,obj_box)
if (coll && !coll.carry) && (counter < target) && !(going) {
	going=1
	elspeed=0
}

if (going) {
	elspeed+=0.4
	height=approach_val(height,0,elspeed)

	var coll=collision_rectangle(x-64,y-height-44,x+64,y-height-12,obj_box,false,true)
	if (coll && !coll.carry) {
		if coll.color == color counter+=1
		
		var i=0;
		repeat(4) {
			with instance_create_depth(coll.x,coll.y,coll.depth,obj_boxparticle) {
				image_angle=i
				color=coll.color
				image_xscale=coll.image_xscale
				image_yscale=coll.image_yscale
			}
			i+=90;
		}
		var part = part_system_create(ps_sparks);
		part_system_depth(part, -100);
		part_system_position(part,coll.x,coll.y)
		instance_destroy(coll);
		audio_play_sound(snd_munch,0,false);
	}
	
	if !(height) {
		releasedelay--;
		var smokeinterval = 10;
		if (releasedelay % smokeinterval) <= 1 {
			with(instance_create_depth(x+64+4,y-height-80,-100,obj_dustparticle)) {
				vspeed=-2
				image_blend=c_dkgray
			}
		}
	}
	
	if !(releasedelay) {
		going=0;
		elspeed=0;
		releasedelay=30;
	}
}
else
{
	height=approach_val(height,96,floor(elspeed))
	elspeed+=0.1
	elspeed=clamp(elspeed,0,4)
}

topcoll.y=y-height-96

if (counter >= target) && (channelid) {
	event_user(0);
}