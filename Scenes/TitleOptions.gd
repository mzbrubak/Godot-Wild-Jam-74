extends CanvasLayer
signal _back_button_pressed

func _ready():
	$"VBoxContainer/Master Volume".value=Settings.mastervolume;
	$"VBoxContainer/Music Volume".value=Settings.musicvolume;
	$"VBoxContainer/SFX Volume".value=Settings.sfxvolume;
	$"VBoxContainer/Tutorial Dialogues".button_pressed=Settings.tutorialmessages;
	$"VBoxContainer/ResolutionOption/ResolutionDropdown".selected=Settings.resolutionid;

func _on_back_button_pressed():
	Settings.savechanges();
	_back_button_pressed.emit();

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
