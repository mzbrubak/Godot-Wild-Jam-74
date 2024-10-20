extends Node
var last_entered="down"
var rng=RandomNumberGenerator.new()
func _on_down_entered(_player):
	if last_entered=="mid":
		$Map.frame=1;
		call_deferred("changecollision",false)
		$THESTAIRSLIEoccluder.visible=true;
		$Door.locked=false
	last_entered="down"
	
func _on_mid_entered(_player):
	if last_entered=="down":
		$Map.frame=0;
		call_deferred("changecollision",true)
		$THESTAIRSLIEoccluder.visible=false;
		if $Door.locked==true:
			$Door.lockedtext="The sign by the door reads B"+str(rng.randi_range(2,9999))+". The door is just painted on the wall."
		$Door.locked=true;
	last_entered="mid"

func _on_up_entered(_player):
	last_entered="up"

func changecollision(state):
	$Walls/THESTAIRSLIEcollision.disabled=state
