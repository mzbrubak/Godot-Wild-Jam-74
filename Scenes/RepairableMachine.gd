extends "InteractableObject.gd"
@export var needs_catalyst:Dictionary
@export var needs_component:Dictionary
@export var altsprite:Texture2D
var fixed=false
@export var interactDialogName="TestDialog"#for setting which dialog to trigger
#note: This uses Sprite2D instead of AnimatedSprite2D since it should only need to switch sprites occasionally
#also note: all print calls will eventually be replaced with calls to dialogue system

func on_interact(player):
	var dialog=Dialogic.start("TestDialog")
	if fixed:
		print("You take a moment to admire your handiwork, closely inspecting this already-repaired machine.")
		return
	var has_catalysts=player.check_inventory(needs_catalyst);
	if has_catalysts==false:
		print("You lack the tools you need to fix this machine.")
		return
	var has_components=player.check_inventory(needs_component);
	if has_components==false:
		print("You need more (or different) parts to fix this machine.")
		return
	player.remove_from_inventory(needs_component)
	needs_component.clear();
	self.texture=altsprite;
	print("Machine repaired successfully!")
	#do something to savefile
