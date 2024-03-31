settings[? "musicvol"] = musicvol
settings[? "soundvol"] = soundvol
settings[? "vsync"] = vsync
settings[? "res"] = res
//settings[? "language"] = global.language

ini_open("dtcsave.ini");
var t_string;
t_string = ds_map_write(all_levels);
ini_write_string("Saved", "0", t_string);
ini_close();

ini_open("dtcconfig.ini");
var t_string2;
t_string2 = ds_map_write(settings);
ini_write_string("Saved", "0", t_string2);
ini_close();

SaveStringToFile("keybinds.ini",input_player_export())