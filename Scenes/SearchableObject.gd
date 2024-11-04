extends "InteractableObject.gd"
var searched=false;
@export var locked=false;
@export var keyid:String
@export var searchableindex:int
@export var contents:Dictionary
@export var search_text:String
@export var empty_text:String
@export var full_sprite:int
@export var empty_sprite:int
@export var locked_text:String
signal searchable_searched

func _ready():
	if SaveData.searchable_flag_list[searchableindex]==true:
		searched=true
		frame=empty_sprite
	else:
		frame=full_sprite

func on_interact(player):
	var textout
	if searched:
		textout=empty_text
		player.show_text(textout)
		return
	if locked:
		if player.check_inventory({keyid: 1}):
			on_successful_search(player)
		else:
			player.show_text(locked_text)
	else:
		on_successful_search(player)
		
func on_successful_search(player):
	player.show_text(search_text)
	player.add_to_inventory(contents)
	self.frame=empty_sprite
	searched=true
	searchable_searched.emit(searchableindex)
