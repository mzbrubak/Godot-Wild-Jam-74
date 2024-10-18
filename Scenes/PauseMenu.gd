extends CanvasLayer


func _on_player_pause_requested():
	get_tree().paused=true
	self.show()

func _on_unpause_button_pressed():
	self.hide()
	get_tree().paused=false

func _ready():
	$"VBoxContainer/Master Volume".value=Settings.mastervolume;
	$"VBoxContainer/Music Volume".value=Settings.musicvolume;
	$"VBoxContainer/SFX Volume".value=Settings.sfxvolume;
	$"VBoxContainer/Tutorial Dialogues".button_pressed=Settings.tutorialmessages;
	$"VBoxContainer/ResolutionOption/ResolutionDropdown".selected=Settings.resolutionid;

func _on_back_button_pressed():
	Settings.savechanges();
	self.hide()
	get_tree().paused=false

func _on_master_volume_value_changed(value):
	Settings.set_mastervolume(value);

func _on_music_volume_value_changed(value):
	Settings.set_musicvolume(value);

func _on_sfx_volume_value_changed(value):
	Settings.set_sfxvolume(value);

func _on_tutorial_dialogues_toggled(toggled_on):
	Settings.set_tutorialmessages(toggled_on);

func _on_resolution_dropdown_item_selected(index):
	Settings.set_resolution(index);

func _on_main_menu_button_pressed():
	Settings.savechanges();
	#Save any other game info
	get_tree().paused=false;
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn");
