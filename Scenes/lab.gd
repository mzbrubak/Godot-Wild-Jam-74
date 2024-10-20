extends Node

func _ready():
	SaveData.lightsout=true;
	$Player/PointLight2D.enabled=true
	$Player/QuietFootstepRange.body_entered.connect($Ghost.IHEARYOU)
	$Player/LoudFootstepRange.body_entered.connect($Ghost.IHEARYOU)
