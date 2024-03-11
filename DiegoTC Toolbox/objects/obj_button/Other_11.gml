if !(active) exit;

active = 0
audio_play_sound(snd_buttonoff,0,0)
global.channel[channelid] = max(0, global.channel[channelid]-1)