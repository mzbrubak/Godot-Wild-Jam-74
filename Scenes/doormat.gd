extends "InteractableObject.gd"
signal victory(count)
var leaveearlytext="You think about leaving without doing your job, but decide against it."
func on_interact(player):
	if SaveData.prologue:
		player.show_text(leaveearlytext)
	elif SaveData.epilogue:
		victory.emit(6)#all 5 + 1 for the experiment
	else:
		var repairedmachinecount=SaveData.machines_repaired.count(true)
		victory.emit(repairedmachinecount)
