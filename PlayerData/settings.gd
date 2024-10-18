extends Node
var resolutionid=0;#this is going to be retooled at some point
var mastervolume:float=50;
var musicvolume:float=50;
var sfxvolume:float=50;
var tutorialmessages:bool=true
#on start, attempt to read setting values from a config.ini file.  If such file does not exist, sets default settings
func _ready():
	var config=ConfigFile.new();
	var err = config.load("user://settings.ini");
	if err!=OK:
		#guess you're stuck with the built-in defaults!  congrats on first boot-up
		return
	resolutionid=config.get_value("Video","resolutionid",0);
	mastervolume=config.get_value("Audio","mastervolume",50);
	musicvolume=config.get_value("Audio","musicvolume",50);
	sfxvolume=config.get_value("Audio","sfxvolume",50);
	tutorialmessages=config.get_value("Gameplay","tutorialmessages",true);
	set_resolution(resolutionid);

func savechanges():
	var config=ConfigFile.new()
	config.set_value("Video","resolutionid",resolutionid);
	config.set_value("Audio","mastervolume",mastervolume);
	config.set_value("Audio","musicvolume",musicvolume);
	config.set_value("Audio","sfxvolume",sfxvolume);
	config.set_value("Gameplay","tutorialmessages",tutorialmessages);
	config.save("user://settings.ini");

func set_resolution(index):
	resolutionid=index;
	var resolution=Vector2i(640*(1+index),360*(1+index));
	DisplayServer.window_set_size(resolution);
	
func set_mastervolume(value):
	mastervolume=value;
	AudioServer.set_bus_volume_db(0,linear_to_db(value/100));
	
func set_musicvolume(value):
	musicvolume=value;
	AudioServer.set_bus_volume_db(1,linear_to_db(value/100));

func set_sfxvolume(value):
	sfxvolume=value;
	AudioServer.set_bus_volume_db(2,linear_to_db(value/100));
	
func set_tutorialmessages(toggled):
	tutorialmessages=toggled;
