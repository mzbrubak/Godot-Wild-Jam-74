extends "InteractableObject.gd"
var searched=false;
@export var locked=false;
@export var keyid:String
@export var index:int
@export var contents:Dictionary
@export var search_text:String
@export var empty_text:String
@export var empty_sprite:int
@export var locked_text:String

func _ready():
	if SaveData.searchable_flag_list[index]==true:
		searched=true
		self.frame=empty_sprite

func on_interact(player):
	var textout
	if searched:
		textout=empty_text
		player.show_text(textout)
		return
	if locked:
		if player.check_inventory({keyid: 1}):
			player.show_text(search_text)
			player.add_to_inventory(contents)
			self.frame=empty_sprite
			searched=true
			SaveData.searchable_flag_list[index]=true
		else:
			player.show_text(locked_text)
