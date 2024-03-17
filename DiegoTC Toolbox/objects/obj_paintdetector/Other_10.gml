if (active) exit;
active = 1
sprite_index=spr_detectoractive
if real(channelid) != 0 global.channel[real(channelid)] += 1