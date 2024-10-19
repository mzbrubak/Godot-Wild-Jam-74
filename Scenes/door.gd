extends "InteractableObject.gd"
@export var locked:bool = false
@export var keyid:String = ""
@export var opentext:String = "You open the door."
@export var lockedtext:String = "The door is locked, and you don't have the right key."
func on_interact(player):
	if locked:
		if player.check_inventory({keyid: 1}):
			player.remove_from_inventory({keyid: 1})
			player.show_text(opentext)
			player.unregister(self)
			self.queue_free()
		else:
			player.show_text(lockedtext)
	else:
		pass
		player.show_text(opentext)
		player.unregister(self)
		self.queue_free()

