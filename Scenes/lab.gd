extends Node
var machines_repaired=[false,false,false,false,false]
var pickup_flag_list=[false,false,false,false]
var searchable_flag_list=[false,false,false,false]

func _ready():
	SaveData.lightsout=true;
	$Player/PointLight2D.enabled=true
	$Player/QuietFootstepRange.IMHERE.connect($Ghost.IHEARYOU)
	$Player/LoudFootstepRange.IMHERE.connect($Ghost.IHEARYOU)
	SaveData.from="Lab"

func rebake_navi():
	$NavigationRegion2D.bake_navigation_polygon()

func on_reset_requested():
	machines_repaired=SaveData.machines_repaired
	pickup_flag_list=SaveData.pickup_flag_list
	searchable_flag_list=SaveData.searchable_flag_list
	$Player.inventory=SaveData.inventory.duplicate(true)
	get_tree().reload_current_scene()
	
func parse_flags():
	#this part basically needs to be done manually in my current setup, rip
	pass

func on_searchable_searched(searchable_index):
	searchable_flag_list[searchable_index]=true
	
func on_pickup_pickedup(pickupindex):
	pickup_flag_list[pickupindex]=true

func on_save_requested():
	SaveData.machines_repaired=machines_repaired
	SaveData.pickup_flag_list=pickup_flag_list
	SaveData.searchable_flag_list=searchable_flag_list
	SaveData.inventory=$Player.inventory.duplicate(true)
	
