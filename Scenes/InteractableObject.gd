extends Sprite2D
#note: This uses Sprite2D instead of AnimatedSprite2D since it should only need to switch sprites occasionally

func on_interact(player):
	var textout="It looks like this hallway has been torn, for lack of a better word, and rather clumsily at that."
	player.show_text(textout)

func _on_interaction_range_body_entered(body):
	body.register(self);

func _on_interaction_range_body_exited(body):
	body.unregister(self);
