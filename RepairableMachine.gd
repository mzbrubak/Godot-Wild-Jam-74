extends Sprite2D
@export var needs:Dictionary
@export var altsprite:Texture2D
#note: This uses Sprite2D instead of AnimatedSprite2D since it should only need to switch sprites occasionally

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_interact():
	self.texture=altsprite;

func _on_interaction_range_body_entered(body):
	body.register(self);

func _on_interaction_range_body_exited(body):
	body.unregister(self);
