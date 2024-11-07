extends Node

func _ready():
	if SaveData.prologue:
		$Player/AnimationPlayer.current_animation="Up"
		$Player/AnimationPlayer.stop()
	else:
		$Player.position=Vector2(31,-71)
		$Player/AnimationPlayer.current_animation="Down"
		$Player/AnimationPlayer.stop()
