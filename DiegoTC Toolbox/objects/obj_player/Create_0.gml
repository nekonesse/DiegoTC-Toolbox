depth = -20;

image_speed = 1;

hsp = 0;
hsp_carry = 0;
hsp_final = 0;
max_hsp = 3;
vsp = 0;
grav = .25;
defaultgrav = grav;
accel = 0.5;
fric = .4;
jumpspeed = 7;
realjump = 0;
canjump = 0;
bufferjump = 0;
wallbuffer = 0;
carrybuffer = 0;
dropbuffer = 0;
move_lock = false;
grounded = false;
xskew = 0;
death = 0;
carrying = 0;
sliding = 0;
slidingtimer = 10;
launched=0;
crouched=0;
jump = 0;

has_winder=false;
is_recording=false;
playback=false;
recordtimer=600;

carryid=undefined;

inwater = false;
antigrav = false;

upsidedown = false;

color = defaultcolor;
xsc=1;
ysc=1;
xstretch=1;
ystretch=1;
rot=0;

/*xpos = ds_list_create();
ypos = ds_list_create();
xsclist = ds_list_create();
xscalelist = ds_list_create();
yscalelist = ds_list_create();
xskewlist = ds_list_create();
spritelist = ds_list_create();

instance_create_layer(x,y,"Instances",obj_camera)
cam = obj_camera*/