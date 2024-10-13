extends Node
var resolution=0;#this is going to be retooled at some point
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
	resolution=config.get_value("Video","resolution");
	mastervolume=config.get_value("Audio","mastervolume",50);
	musicvolume=config.get_value("Audio","musicvolume",50);
	sfxvolume=config.get_value("Audio","sfxvolume",50);
	tutorialmessages=config.get_value("Gameplay","tutorialmessages",true);

func savechanges():
	var config=ConfigFile.new()
	config.set_value("Video","resolution",resolution);
	config.set_value("Audio","mastervolume",mastervolume);
	config.set_value("Audio","musicvolume",musicvolume);
	config.set_value("Audio","sfxvolume",sfxvolume);
	config.set_value("Gameplay","tutorialmessages",tutorialmessages);
	config.save("user://settings.ini");
