extends Node
var machines_repaired=[false,false,false,false,false]
var savegame_exists:bool = false

func _ready():
	var config=ConfigFile.new();
	var err = config.load("user://savedata.ini");
	if err!=OK:
		#guess you're stuck with the built-in defaults!  congrats on first boot-up
		savegame_exists=false
		return
	machines_repaired=config.get_value("","Machines Repaired", machines_repaired)
	
