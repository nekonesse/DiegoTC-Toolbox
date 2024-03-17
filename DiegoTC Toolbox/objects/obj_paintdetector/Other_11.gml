if !active exit;
active = 0
sprite_index=spr_detector
global.channel[real(channelid)] = max(0,global.channel[real(channelid)]-1)