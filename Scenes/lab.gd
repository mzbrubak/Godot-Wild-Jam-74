extends Node

func _ready():
	SaveData.lightsout=true;
	$Player/PointLight2D.enabled=true
	$Player/QuietFootstepRange.IMHERE.connect($Ghost.IHEARYOU)
	$Player/LoudFootstepRange.IMHERE.connect($Ghost.IHEARYOU)
	SaveData.from="Lab"

func rebake_navi():
	$NavigationRegion2D.bake_navigation_polygon()
