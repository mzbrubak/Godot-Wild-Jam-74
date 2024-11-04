extends CanvasLayer
signal reset_to_entry

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_player_caught():
	visible=true
	$DeathSound.playing=true


func _on_retry_button_pressed():
	reset_to_entry.emit()
