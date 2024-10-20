extends Area2D
signal IMHERE
func _ready():
	self.monitoring=false

func _on_body_entered(body):
	IMHERE.emit(self.global_position)
