extends Area2D
func _ready():
	self.monitoring=false

func emit_sound_start():
	self.monitoring=true

func emit_sound_end():
	self.monitoring=false
