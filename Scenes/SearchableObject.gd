extends "InteractableObject.gd"
var searched=false;
@export var contents:Dictionary
@export var search_text:String
@export var empty_text:String
@export var empty_sprite:Texture2D

func on_interact(player):
	var textout
	if searched:
		textout=empty_text
		player.show_text(textout)
		return
	#code only gets here if not searched yet
	textout=search_text
	player.show_text(textout)
	player.add_to_inventory(contents);
	contents.clear();
	self.texture=empty_sprite;
	searched=true
	#do something to save file
