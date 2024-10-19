extends "InteractableObject.gd"
@export var needs_catalyst:Dictionary
@export var needs_component:Dictionary
@export var altsprite:Texture2D
var fixed=false
#note: This uses Sprite2D instead of AnimatedSprite2D since it should only need to switch sprites occasionally
#also note: all print calls will eventually be replaced with calls to dialogue system

func on_interact(player):
	var textout
	if fixed:
		textout="You take a moment to admire your handiwork, closely inspecting this already-repaired machine."
		player.show_text(textout)
		return
	var has_catalysts=player.check_inventory(needs_catalyst);
	if has_catalysts==false:
		textout="You lack the tools you need to fix this machine."
		player.show_text(textout)
		return
	var has_components=player.check_inventory(needs_component);
	if has_components==false:
		textout="You need more (or different) parts to fix this machine."
		player.show_text(textout)
		return
	player.remove_from_inventory(needs_component)
	needs_component.clear();
	self.texture=altsprite;
	textout="Machine repaired successfully!"
	player.show_text(textout)
	fixed=true

