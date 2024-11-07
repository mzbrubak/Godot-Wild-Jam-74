extends Node

func _ready():
	$Player/PointLight2D.enabled=true
	if SaveData.from=="Lab":
		$Player.position=Vector2(244,5)
	elif SaveData.from=="Stairs":
		$Player.position=Vector2(-176,5)

func _on_save_requested():
	SaveData.inventory=$Player.inventory.duplicate(true)
	SaveData.elevator_panel_fixed=$Elevator.fixed
	
