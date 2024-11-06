extends "InteractableObject.gd"
@export var contents:Dictionary
@export var pickuptext:String
@export var pickupindex:int
signal gettable_got(index:int)

func on_interact(player):
	player.show_text(pickuptext)
	player.add_to_inventory(contents);
	player.unregister(self);
	#do something to savefile
	gettable_got.emit(pickupindex)
	self.queue_free();

func setstatefromsave():
	if SaveData.pickup_flag_list[pickupindex]:
		gettable_got.emit(pickupindex)
		self.queue_free();
