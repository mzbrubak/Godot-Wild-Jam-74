extends "InteractableObject.gd"
@export var needs_catalyst:Dictionary = {"large_screwdriver":1}
@export var needs_component:Dictionary = {"wire":7,"large_capacitor":3,"switch":1}
@export var floor:int
var fixed=false
var player_ref
var destination

func on_interact(player):
	var textout
	if floor==1 and SaveData.lightsout==false:
		textout="You take the elevator down to the basement."
		player.show_text(textout)
		player.dialoguepause_requested.connect(on_interact_end)
		player_ref=player
		destination="res://Scenes/hallway.tscn"
	elif floor==1:
		textout="You have no particular desire to go back down the elevator."
		player.show_text(textout)
	elif SaveData.lightsout==false:
		textout="Your sense of professional integrity prevents you from leaving now."
		player.show_text(textout)
	else:
		if fixed:
			if player.check_inventory({"crowbar":1}):
				textout=("You force the elevator door open with the crowbar, then take the elevator back up to the lobby.")
				player.show_text(textout)
				player.dialoguepause_requested.connect(on_interact_end)
				player_ref=player
				destination="res://Scenes/testmap.tscn"
			else:
				textout="The elevator door is stuck shut."
				player.show_text(textout)
			return
		var has_catalysts=player.check_inventory(needs_catalyst);
		if has_catalysts==false:
			textout="You lack the tools you need to fix the elevator panel."
			player.show_text(textout)
			return
		var has_components=player.check_inventory(needs_component);
		if has_components==false:
			textout="You need more (or different) parts to fix the elevator panel."
			player.show_text(textout)
			return
		player.remove_from_inventory(needs_component)
		needs_component.clear();
		textout="You fix the elevator panel!"
		player.show_text(textout)
		fixed=true

func on_interact_end(status):
	if status==false:
		SaveData.inventory=player_ref.inventory
		get_tree().change_scene_to_file(destination);
