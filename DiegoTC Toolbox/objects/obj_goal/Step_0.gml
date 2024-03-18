if (place_meeting(x,y,obj_player)) && uh == 0
{
uh = 1;
audio_play_sound(snd_levelcomplete,10,false)

//completelevel(room_get_name(room))
if room_exists(room_next(room))
    TransitionStart(room_next(room),sqRoomFadeOut,sqRoomFadeIn)
else
    TransitionStart(rm_lvlselect,sqRoomFadeOut,sqRoomFadeIn)
}
