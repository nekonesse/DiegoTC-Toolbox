/// @description You must DIE
death=1; //having a death variable is kind of useless now that i think about it LOL
is_recording=0; 
audio_play_once(snd_restart,10)
instance_destroy();
var i=0;
repeat(4) {
	with instance_create_depth(x,y,depth,obj_diegobit) {
		image_angle=i
		color=other.color
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
	}
	i+=90;
}
TransitionStart(room,sqRoomFadeOut,sqRoomFadeIn)