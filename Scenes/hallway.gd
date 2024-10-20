extends Node

func _ready():
	$Player/PointLight2D.enabled=true
	if SaveData.lightsout:
		$Player.position=Vector2(244,5)
