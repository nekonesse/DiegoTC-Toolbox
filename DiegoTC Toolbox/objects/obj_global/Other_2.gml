audio_group_load(musicgroup)
audio_group_load(soundgroup)

all_levels = ds_map_create();
ini_open("dtcsave.ini");
var t_string = ini_read_string("Saved", "0", "");
if (t_string != "")
{
    ds_map_read(all_levels, t_string);
}
ini_close();

/*all_packs = ds_map_create();
ini_open("dtcsave.ini");
var t_string = ini_read_string("Saved", "0", "");
if (t_string != "")
{
    ds_map_read(all_packs, t_string);
}
ini_close();*/

settings = ds_map_create();

ini_open("dtcconfig.ini");
var t_string2 = ini_read_string("Saved", "0", "");
if (t_string2 != "")
{
    ds_map_read(settings, t_string2);
}
ini_close();

if settings[? "resolution"] < 3.1
res = settings[? "resolution"]
else
settings[? "resolution"] = res

if settings[? "soundvol"] < 1.1
soundvol = settings[? "soundvol"]
else
settings[? "soundvol"] = soundvol

if settings[? "musicvol"] < 1.1
musicvol = settings[? "musicvol"]
else
settings[? "musicvol"] = musicvol

if settings[? "vsync"] < 1
vsync = settings[? "vsync"]
else
settings[? "vsync"] = vsync

/*if settings[? "language"] == "english" || settings[? "language"] == "espanol"
global.language = settings[? "language"]
else
settings[? "language"] = "english"*/

display_reset(0,vsync);

if file_exists("keybinds.ini")
{
        var opstruct = LoadJSONFromFile("keybinds.ini")
        if input_player_verify(opstruct) input_player_import(opstruct);
		else SaveStringToFile("keybinds.ini",input_player_export())
}