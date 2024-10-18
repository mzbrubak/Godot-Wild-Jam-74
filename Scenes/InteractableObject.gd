extends Sprite2D
#note: This uses Sprite2D instead of AnimatedSprite2D since it should only need to switch sprites occasionally

func on_interact(player):
	print("If you're seeing this, I must not have bothered defining an actual interaction here.  Whoops!")

func _on_interaction_range_body_entered(body):
	body.register(self);

func _on_interaction_range_body_exited(body):
	body.unregister(self);
