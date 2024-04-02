if (obj_global.paused) exit;

size-=decayspeed;
if size <= 0 instance_destroy();