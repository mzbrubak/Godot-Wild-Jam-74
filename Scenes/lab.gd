extends Node
var machines_repaired=[false,false,false,false,false]
var pickup_flag_list=[false,false,false,false]
var searchable_flag_list=[false,false,false,false]

func _ready():
	SaveData.lightsout=true;#update this, bad flag approach
	SaveData.prologue=false;
	$Player/PointLight2D.enabled=true
	$Player/QuietFootstepRange.IMHERE.connect($Ghost.IHEARYOU)
	$Player/LoudFootstepRange.IMHERE.connect($Ghost.IHEARYOU)
	SaveData.from="Lab"
	machines_repaired=SaveData.machines_repaired.duplicate(true)
	pickup_flag_list=SaveData.pickup_flag_list.duplicate(true)
	searchable_flag_list=SaveData.searchable_flag_list.duplicate(true)
	parse_flags()#this actually sets objects to match 

func rebake_navi():
	$NavigationRegion2D.bake_navigation_polygon()

func on_reset_requested():
	machines_repaired=SaveData.machines_repaired.duplicate()
	pickup_flag_list=SaveData.pickup_flag_list.duplicate()
	searchable_flag_list=SaveData.searchable_flag_list.duplicate()
	$Player.inventory=SaveData.inventory.duplicate(true)
	get_tree().reload_current_scene()
	
func parse_flags():
	get_tree().call_group("Gettables","setstatefromsave")
	get_tree().call_group("Searchables","setstatefromsave")

func on_searchable_searched(searchable_index:int):
	searchable_flag_list[searchable_index]=true

func on_save_requested():
	SaveData.machines_repaired=machines_repaired.duplicate(true)
	SaveData.pickup_flag_list=pickup_flag_list.duplicate(true)
	SaveData.searchable_flag_list=searchable_flag_list.duplicate(true)
	SaveData.inventory=$Player.inventory.duplicate(true)
	
func _on_gettable_got(index:int): #note: code is spaghetti, inconsistent names.  be more aware/proactive of this next jam
	pickup_flag_list[index]=true
	#rebake_navi() this honestly isn't necessary for this prototype, and causes too many bake requests on reloading room
