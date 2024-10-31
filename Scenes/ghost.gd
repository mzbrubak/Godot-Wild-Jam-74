extends CharacterBody2D
var pathfinder
var navigationReady: bool = false
@onready var _animation_player=$AnimationPlayer
const SPEED=150
var movement_delta:float
var next_path_position=self.global_position
func _ready()->void:
	pathfinder=get_node("NavigationAgent2D")
	NavigationServer2D.map_changed.connect(startNavigation)
	
func set_movement_target(movement_target:Vector2):
	if navigationReady:
		pathfinder.set_target_position(movement_target);

func IHEARYOU(pos):
	print("I HEAR YOU AT "+str(pos.x),","+str(pos.y))
	set_movement_target(pos)

func physics_process(_delta):
	next_path_position=$NavigationAgent2D.get_next_path_position()
	velocity = global_position.direction_to(next_path_position)*SPEED
	move_and_slide()
	if velocity==Vector2(0,0):
		_animation_player.stop()
	else:
		set_direction()

func set_direction():
	if velocity.x>0 and abs(velocity.x)>abs(velocity.y):
		_animation_player.play("Left")
	elif velocity.x<0 and abs(velocity.x)>abs(velocity.y):
		_animation_player.play("Right")
	elif velocity.y>0:
		_animation_player.play("Down")
	elif velocity.y<0:
		_animation_player.play("Up")
		
func startNavigation(mapRID):
	pathfinder.set_navigation_map(mapRID)
	pathfinder.set_navigation_layer_value(1,true);
	pathfinder.set_max_speed(SPEED);
	pathfinder.set_target_position(self.position)#don't move right away
	navigationReady=true
	NavigationServer2D.map_changed.disconnect(startNavigation)
