extends CharacterBody2D
const RUNSPEED = 300
const WALKSPEED = 100
signal pause_requested
var facing=Vector2(0,0);
var interactioncandidates=[];
var inventory:Dictionary

func _ready():
	inventory["small_screwdriver"]=0;
	inventory["medium_screwdriver"]=0;
	inventory["large_screwdriver"]=0;
	inventory["crowbar"]=0;
	inventory["stairkey"]=0;
	inventory["small_capacitor"]=0;
	inventory["large_capacitor"]=0;
	inventory["logic_chip_a"]=0;
	inventory["logic_chip_b"]=0;
	inventory["switch"]=0;
	inventory["wire"]=0;
	inventory["key1"]=0;
	inventory["key2"]=0;
	inventory["key3"]=0;

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down");
	if direction:
		facing=direction;#fallback for interaction clashing
		velocity = direction * RUNSPEED
	else:
		velocity=Vector2(0,0)
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pause_requested.emit();
	if Input.is_action_just_pressed("Interact"):
		interact()

func register(object):
	interactioncandidates.append(object);
	
func unregister(object):
	interactioncandidates.erase(object);

func interact():
	if interactioncandidates.size()==1:
		interactioncandidates[0].on_interact()
	elif interactioncandidates.size()>1:
		interact_conflict_resolve()
		
func interact_conflict_resolve():
	#decide which object is most directly being looked at by the player.  In event of ties, first come first serve
	var dotproduct=0
	var maxdotproduct=0
	var maxfacingobject=null
	for candidate in interactioncandidates:
		dotproduct=facing.dot((candidate.position - self.position).normalized());
		if dotproduct>maxdotproduct:
			maxdotproduct=dotproduct;
			maxfacingobject=candidate;
	if maxfacingobject!=null:
		maxfacingobject.on_interact();
