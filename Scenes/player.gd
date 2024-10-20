extends CharacterBody2D
const RUNSPEED = 300
const WALKSPEED = 100
signal pause_requested
signal dialoguepause_requested
var facing=Vector2(0,0);
var interactioncandidates=[];
var inventory:Dictionary
var movespeed=WALKSPEED
var not_busy=1

func _ready():
	inventory=SaveData.inventory
	set_inventory_text()
	$PointLight2D.enabled=SaveData.lightsout

func _input(event):
	if event.is_action_pressed("Pause"):
		pause_requested.emit();
	if event.is_action_pressed("Interact"):
		interact();
	if event.is_action_pressed("ShowInventory"):
		$Inventory.visible=true
	if event.is_action_released("ShowInventory"):
		$Inventory.visible=false
	if event.is_action_pressed("AltSpeed"):
		movespeed=RUNSPEED;
	if event.is_action_released("AltSpeed"):
		movespeed=WALKSPEED;

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down");
	if direction:
		facing=direction;#fallback for interaction clashing
		velocity = direction * movespeed*not_busy
		set_animation(direction)
	else:
		velocity=Vector2(0,0)
		$AnimationPlayer.stop()
	move_and_slide()

func set_animation(direction):
	var x=direction.x;
	var y=direction.y;
	if movespeed==RUNSPEED:
		if x>0 and abs(x)>abs(y):
			$AnimationPlayer.current_animation="RightFast"
		elif x<0 and abs(x)>abs(y):
			$AnimationPlayer.current_animation="LeftFast"
		elif y<0:
			$AnimationPlayer.current_animation="UpFast"
		elif y>0:
			$AnimationPlayer.current_animation="DownFast"
	elif movespeed==WALKSPEED:
		if x>0 and abs(x)>abs(y):
			$AnimationPlayer.current_animation="Right"
		elif x<0 and abs(x)>abs(y):
			$AnimationPlayer.current_animation="Left"
		elif y<0:
			$AnimationPlayer.current_animation="Up"
		elif y>0:
			$AnimationPlayer.current_animation="Down"

func _process(delta):
	pass

func register(object):
	interactioncandidates.append(object);
	
func unregister(object):
	interactioncandidates.erase(object);

func interact():
	if not_busy:
		if interactioncandidates.size()==1:
			interactioncandidates[0].on_interact(self)
		elif interactioncandidates.size()>1:
			interact_conflict_resolve()
	else:
		hide_text();
		dialogueunpause();
		
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
		maxfacingobject.on_interact(self);

func check_inventory(dict):
	for item in dict:
		if inventory[item]<dict[item]:
			return false
	return true

func remove_from_inventory(dict):
	#only call this after a successful check_inventory
	for item in dict:
		inventory[item]-=dict[item];
	set_inventory_text()

func add_to_inventory(dict):
	for item in dict:
		inventory[item]+=dict[item];
	set_inventory_text()

func set_inventory_text():
	var inventory_text="Inventory:\n";
	if inventory["crowbar"]>0:
		inventory_text+=("Crowbars: "+str(inventory["crowbar"])+"\n")
	var key_count=inventory["stairkey"]+inventory["key1"]+inventory["key2"]+inventory["key3"]
	if key_count>0:
		inventory_text+=("Keys: "+str(key_count)+"\n")
	var screwdriver_count=inventory["small_screwdriver"]+inventory["medium_screwdriver"]+inventory["large_screwdriver"]
	if screwdriver_count>0:
		inventory_text+=("Screwdrivers: "+str(screwdriver_count)+"\n")
	var part_count=inventory["small_capacitor"]+inventory["large_capacitor"]+inventory["wire"]+inventory["switch"]+inventory["logic_chip_a"]+inventory["logic_chip_b"]
	if part_count>0:
		inventory_text+=("Parts: "+str(part_count)+"\n")
	if inventory_text=="Inventory:\n":
		inventory_text+="Nothing.  Nothing at all.\n"
	$Inventory/VBoxContainer/Label.text=inventory_text;

func show_text(string):
	$Dialogue/HFlowContainer/DialogueBox/Text.text=string;
	$Dialogue.visible=true
	dialoguepause()

func hide_text():
	$Dialogue.visible=false

func dialoguepause():
	dialoguepause_requested.emit(true)
	not_busy=0
	pass
	
func dialogueunpause():
	dialoguepause_requested.emit(false)
	not_busy=1
	pass
