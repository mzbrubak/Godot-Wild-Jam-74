extends Node


func _on_new_game_button_pressed():
	#Load first scene
	pass # Replace with function body.


func _on_continue_button_pressed():
	#Load scene based on save data
	pass # Replace with function body.


func _on_options_button_pressed():
	#Transition to options screen
	get_tree().change_scene_to_file("res://Scenes/options_from_title.tscn")


func _on_exit_button_pressed():
	#close the game
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
