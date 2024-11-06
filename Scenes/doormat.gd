extends "InteractableObject.gd"
signal victory
var leaveearlytext="You think about leaving without doing your job, but decide against it."
func on_interact(player):
	if SaveData.prologue:
		player.show_text(leaveearlytext)
	elif SaveData.epilogue:
		pass#good end text
	else:
		pass#neutral ending - check number of machines repaired.
		
