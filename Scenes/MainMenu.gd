extends Node

func _ready():
	$MainMenuUI.visible=true;
	$"Credits Screen".visible=false;

func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/testmap.tscn");

func _on_continue_button_pressed():
	#Load scene based on save data
	pass # Replace with function body.

func _on_options_button_pressed():
	$MainMenuUI.hide();
	$TitleOptionsLayer.show();

func _on_credits_button_pressed():
	$MainMenuUI.hide();
	$"Credits Screen".show();

func _on_exit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func _on_credits_screen__back_button_pressed():
	$"Credits Screen".hide();
	$MainMenuUI.show();


func _on_title_options_layer__back_button_pressed():
	$TitleOptionsLayer.hide();
	$MainMenuUI.show();
