extends CharacterBody2D
const RUNSPEED = 300
const WALKSPEED = 100
signal pause_requested

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down");
	if direction:
		velocity = direction * RUNSPEED
	else:
		velocity=Vector2(0,0)
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pause_requested.emit();
