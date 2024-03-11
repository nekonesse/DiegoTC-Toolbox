if (active) exit;

active = 1
audio_play_sound(snd_buttonon,0,0)
if (channelid) global.channel[channelid] += 1