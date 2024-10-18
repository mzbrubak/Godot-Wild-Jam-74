extends "InteractableObject.gd"
var searched=false;
@export var contents:Dictionary
@export var search_text:String
@export var empty_text:String
@export var empty_sprite:Texture2D

func on_interact(player):
	if searched:
		print(empty_text)
		return
	#code only gets here if not searched yet
	print(search_text)
	player.add_to_inventory(contents);
	contents.clear();
	self.texture=empty_sprite;
	#do something to save file
