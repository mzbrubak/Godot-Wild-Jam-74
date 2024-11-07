extends "InteractableObject.gd"
@export var needs_catalyst:Dictionary = {}
@export var needs_component:Dictionary = {"wire":1}
@export var no_catalyst_text:String = "You can't start repairing the machine without removing the outer casing, and you don't have a screwdriver of the right size. Maybe you can find one?"
@export var no_component_text:String = "After removing the outer casing, you are able to assess what parts you need to fix the machine.  Unfortunately, you don't have the right parts."
@export var fixing_text:String = "You have everything you need to fix this machine. You fix the machine as quickly and quietly as you can."
@export var fixed_text:String = "You admire your handiwork as you stare at this already-repaired machine."
@export var machine_index:int = 0
@export var brokenframe:int=0
var fixed=false
signal machine_repaired(index:int)

func _ready():
	frame=brokenframe

func on_interact(player):
	if fixed:#if you already fixed it
		player.show_text(fixed_text)
	elif player.check_inventory(needs_catalyst)==false:#if you don't have tools
		player.show_text(no_catalyst_text)
	elif player.check_inventory(needs_component)==false:#if you don't have parts
		player.show_text(no_component_text)
	else:#time to fix it!
		on_successful_fix(player)

func on_successful_fix(player):
	player.show_text(fixing_text)
	player.remove_from_inventory(needs_component)
	self.frame=self.frame+3
	$Redlight.enabled=false
	$Redlight/Timer.stop()
	$Greenlight.enabled=true
	fixed=true
	machine_repaired.emit(machine_index)
	
func setstatefromsave():
	if SaveData.machines_repaired[machine_index]==true:
		fixed=true
		frame=brokenframe+3
		$Redlight.enabled=false
		$Redlight/Timer.stop()
		$Greenlight.enabled=true
