extends Node
var machines_repaired=[false,false,false,false,false]
var savegame_exists:bool = false
var player_position=0
var enemy_position=0
var pickup_list=[{"Small Screwdriver":1}]
var searchable_list=[{"Wire":17,"Logic Chip":3},{"Small Capacitor":3}]
var flag_list=[]
var inventory=[]
var config
func _ready():
	pass
	config=ConfigFile.new();
	var err = config.load("user://savedata.ini");
	if err!=OK:
		savegame_exists=false
	else:
		savegame_exists=true
	
func loadsavedgame():
	var config=ConfigFile.new();
	var err = config.load("user://savedata.ini");
	if err!=OK:
		#guess you're stuck with the built-in defaults!  congrats on first boot-up
		savegame_exists=false
		return
	savegame_exists=true
	machines_repaired=config.get_value("","Machines Repaired", machines_repaired)
	player_position=config.get_value("","Player_Position", player_position)
	enemy_position=config.get_value("","Enemy_Position",enemy_position)
	pickup_list=config.get_value("","pickup_list",pickup_list)
	searchable_list=config.get_value("","searchable_list",searchable_list)
	flag_list=config.get_value("","flag_list",flag_list)
	inventory=config.get_value("","inventory",inventory)
	
	
func savegame():
	var config=ConfigFile.new()
	config.set_value("","Machines Repaired",machines_repaired);
	config.set_value("","Player_Position",player_position);
	config.set_value("","Enemy_Position",enemy_position);
	config.set_value("","pickup_list",pickup_list);
	config.set_value("","searchable_list",searchable_list);
	config.set_value("","flag_list",flag_list);
	config.set_value("","inventory",inventory);
	config.save("user://savedata.ini");
