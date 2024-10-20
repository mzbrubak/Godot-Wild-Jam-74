extends "InteractableObject.gd"
@export var contents:Dictionary
@export var pickuptext:String
signal rebake_navi

func on_interact(player):
	player.show_text(pickuptext)
	player.add_to_inventory(contents);
	player.unregister(self);
	#do something to savefile
	self.queue_free();
	rebake_navi.emit()
