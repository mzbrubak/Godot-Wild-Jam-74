extends "InteractableObject.gd"
@export var locked:bool = false
@export var keyid:String = ""
@export var opentext:String = "You open the door."
@export var lockedtext:String = "The door is locked, and you don't have the right key."
@export var destination:String = ""
var player_ref
func on_interact(player):
	if locked:
		if player.check_inventory({keyid: 1}):
			player.show_text(opentext)
			player.dialoguepause_requested.connect(on_interact_end)
		else:
			player.show_text(lockedtext)
	else:
		pass
		player.show_text(opentext)
		player.dialoguepause_requested.connect(on_interact_end)
		player_ref=player

func on_interact_end(status):
	if status==false:
		SaveData.inventory=player_ref.inventory
		get_tree().change_scene_to_file(destination);
