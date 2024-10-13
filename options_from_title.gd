extends Node

func _ready():
	$"VBoxContainer/Master Volume".value=Settings.mastervolume;
	$"VBoxContainer/Music Volume".value=Settings.musicvolume;
	$"VBoxContainer/SFX Volume".value=Settings.sfxvolume;
	$"VBoxContainer/Tutorial Dialogues".button_pressed=Settings.tutorialmessages;

func _on_back_button_pressed():
	Settings.savechanges();
	get_tree().change_scene_to_file("res://main_menu.tscn");

func _on_master_volume_value_changed(value):
	Settings.mastervolume=value;

func _on_music_volume_value_changed(value):
	Settings.musicvolume=value;

func _on_sfx_volume_value_changed(value):
	Settings.sfxvolume=value;

func _on_tutorial_dialogues_toggled(toggled_on):
	Settings.tutorialmessages=toggled_on;
