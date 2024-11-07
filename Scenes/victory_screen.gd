extends CanvasLayer

func on_victory(count):
	if count==6:
		$VBoxContainer/VictoryText.text="Fighting the feeling that you've left something unfinished, you escape the lab safely.\n"
	else:
		$VBoxContainer/VictoryText.text="You successfully escaped the lab and go home to rest after a hard night's work.\n"
		
	$VBoxContainer/VictoryText.text+="\nMachines repaired: "
	$VBoxContainer/VictoryText.text+=str(min([count,5]))
	$VBoxContainer/VictoryText.text+=" of 5\n"
	$VBoxContainer/VictoryText.text+="\nThank you for playing!"
	self.visible=true
