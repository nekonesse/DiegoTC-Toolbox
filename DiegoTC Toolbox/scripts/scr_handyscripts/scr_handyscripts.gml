/// @description wrap_val(value, min, max)
/// @param value
/// @param min
/// @param max
function wrap_val(argument0, argument1, argument2) {
	// Returns the value wrapped, values over or under will be wrapped around
 
	if (argument0 mod 1 == 0)
	{
	    while (argument0 > argument2 || argument0 < argument1)
	    {
	        if (argument0 > argument2)
	            argument0 += argument1 - argument2 - 1;
	        else if (argument0 < argument1)
	            argument0 += argument2 - argument1 + 1;
	    }
	    return(argument0);
	}
	else
	{
	    var vOld = argument0 + 1;
	    while (argument0 != vOld)
	    {
	        vOld = argument0;
	        if (argument0 < argument1)
	            argument0 = argument2 - (argument1 - argument0);
	        else if (argument0 > argument2)
	            argument0 = argument1 + (argument0 - argument2);
	    }
	    return(argument0);
	}



}

/// @description pos_wave(from, to, duration, offset)
/// @param from
/// @param  to
/// @param  duration
/// @param  offset
function wave_val(argument0, argument1, argument2, argument3) {
 
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
	a4 = (argument1 - argument0) * 0.5;
	return argument0 + a4 + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi*2)) * a4;



}

function jump_in_direction(_spd, _direction){
	x += lengthdir_x(_spd,_direction)
	y += lengthdir_y(_spd,_direction)
}

/// @description draw_rect(x, y, w, h, color, alpha)
/// @param x
/// @param y
/// @param w
/// @param h
/// @param color
/// @param alpha
function draw_rect(argument0, argument1, argument2, argument3, argument4, argument5){
	draw_sprite_stretched_ext(spr_1x1,0,argument0,argument1,argument2,argument3,argument4,argument5)

}

/// @arg sprite
/// @arg subimg
/// @arg x
/// @arg y
/// @arg xscale
/// @arg yscale
/// @arg rot
/// @arg alpha
/// @arg kx How much X skews per each pixel of Y
/// @arg ky How much Y skews per each pixel of X
/// @arg xmult Post-skew, post-rotate scale X
/// @arg ymult Post-skew, post-rotate scale Y
function draw_sprite_ext_skew(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {

	// get the arguments:
	var sprite = argument0, subimg = argument1, _x = argument2, _y = argument3,
	    scalex = argument4, scaley = argument5, rot = argument6, alpha = argument7,
	    skew_kx = argument8, skew_ky = argument9, skew_sx = argument10, skew_sy = argument11;

	// compute values that will be reused:
	var rcos = dcos(rot);
	var rsin = -dsin(rot);
	var x1 = -sprite_get_xoffset(sprite) * scalex;
	var x2 = x1 + sprite_get_width(sprite) * scalex;
	var y1 = -sprite_get_yoffset(sprite) * scaley;
	var y2 = y1 + sprite_get_height(sprite) * scaley;

	// compute corner coordinates:
	for (var c = 0; c < 4; c++) {
	    // pick local corner
	    var lx; if (c & 1) lx = x2; else lx = x1;
	    var ly; if (c & 2) ly = y2; else ly = y1;
	    // see https://yal.cc/2d-pivot-points/:
	    var rx = lx * rcos - ly * rsin;
	    var ry = lx * rsin + ly * rcos;
	    // transform and store corner coordinates:
	    global._draw_sprite_ext_skew_x[c] = _x + (rx + ry * skew_kx) * skew_sx;
	    global._draw_sprite_ext_skew_y[c] = _y + (ry + rx * skew_ky) * skew_sy;
	}

	// draw the sprite quad:
	draw_sprite_pos(sprite, subimg,
	    global._draw_sprite_ext_skew_x[0],
	    global._draw_sprite_ext_skew_y[0],
	    global._draw_sprite_ext_skew_x[1],
	    global._draw_sprite_ext_skew_y[1],
	    global._draw_sprite_ext_skew_x[3],
	    global._draw_sprite_ext_skew_y[3],
	    global._draw_sprite_ext_skew_x[2],
	    global._draw_sprite_ext_skew_y[2],
	    alpha
	);
}

/// @description Chance(percent)
/// @param percent
function chance(percent){
 
	// Returns true or false depending on RNG
	// ex: 
	//      Chance(0.7);    -> Returns true 70% of the time
 
	return percent > irandom(1);
}

/// @description  approach_val(a, b, amount)
/// @param a
/// @param  b
/// @param  amount
function approach_val(argument0, argument1, argument2) {
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice bcause it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);
 
	if (argument0 < argument1)
	{
	    argument0 += argument2;
	    if (argument0 > argument1)
	        return argument1;
	}
	else
	{
	    argument0 -= argument2;
	    if (argument0 < argument1)
	        return argument1;
	}
	return argument0;



}

/// @description  audio_play_once(sound,priority)
/// @param sound
/// @param priority
function audio_play_once(sound,priority) {
	if !audio_is_playing(sound) {
		audio_play_sound(sound,priority,0)
	}
}

function LoadJSONFromFile(_fileName) {
    //@desc load json from file

    var buffer = buffer_load( _fileName );
    var _string = buffer_read(buffer,buffer_string);
    buffer_delete(buffer);

    var _json = json_parse(_string);
    return _json;

}

function SaveStringToFile(_fileName, _string) {
    //@description save string to file of choice
    
    var _buffer = buffer_create( string_byte_length(_string)+1, buffer_fixed, 1);
    buffer_write(_buffer,buffer_string,_string)
    buffer_save(_buffer,_fileName)
    buffer_delete(_buffer)

}