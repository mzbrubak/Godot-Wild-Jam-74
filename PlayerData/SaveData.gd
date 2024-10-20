extends Node
var machines_repaired=[false,false,false,false,false]
var lightsout:bool=false
var pickup_flag_list=[false,false,false,false,false,false,false]
var searchable_flag_list=[false,false,false,false,false,false,false]
var inventory:Dictionary
var from="lobby"
func _ready():
	inventory["small_screwdriver"]=0;
	inventory["medium_screwdriver"]=0;
	inventory["large_screwdriver"]=0;
	inventory["crowbar"]=0;
	inventory["stairkey"]=0;
	inventory["small_capacitor"]=0;
	inventory["large_capacitor"]=0;
	inventory["logic_chip_a"]=0;
	inventory["logic_chip_b"]=0;
	inventory["switch"]=0;
	inventory["wire"]=0;
	inventory["key1"]=0;
	inventory["key2"]=0;
	inventory["key3"]=0;
	inventory["Nonexistent Key"]=0;

