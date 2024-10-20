extends Node

func _ready():
	$Player/AnimationPlayer.current_animation="Up"
	$Player/AnimationPlayer.stop()
