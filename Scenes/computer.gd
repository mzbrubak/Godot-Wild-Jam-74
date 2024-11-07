extends "InteractableObject.gd"
var unrepairedcount
signal despawnghost
# Called when the node enters the scene tree for the first time.
func _ready():
	unrepairedcount=SaveData.machines_repaired.count(false)

func on_interact(player):
	var textout=""
	if unrepairedcount==0:
		textout+="The monitor reads 'NO FAULTS DETECTED. RESUME EXPERIMENT (Y/N)?' You follow the on-screen instructions to resume the experiment. "
		player.show_text(textout)
		SaveData.epilogue=true
		SaveData.lightsout=false
		$AudioStreamPlayer2D.playing=true
		despawnghost.emit()
	else:
		textout+="The monitor reads 'ERROR: EXPERIMENT HALTED. ELECTRICAL FAULTS DETECTED IN "
		textout+=str(unrepairedcount)
		textout+=" MACHINES. RESUME EXPERIMENT FROM HERE AFTER ISSUES RESOLVED."
		player.show_text(textout)
