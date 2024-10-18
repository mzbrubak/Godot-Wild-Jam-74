extends "InteractableObject.gd"
@export var contents:Dictionary
@export var pickuptext:String

func on_interact(player):
	print(pickuptext)
	player.add_to_inventory(contents);
	player.unregister(self);
	#do something to savefile
	self.queue_free();
