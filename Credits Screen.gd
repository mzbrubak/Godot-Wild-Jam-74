extends CanvasLayer
signal _back_button_pressed

func _on_back_button_pressed():
	_back_button_pressed.emit();
