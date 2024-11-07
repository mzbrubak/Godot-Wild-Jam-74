extends PointLight2D
var rng
@export var flickerchance=0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(flicker)
	rng=RandomNumberGenerator.new()

func flicker():
	var flickercheck=rng.randf()
	if flickercheck<=flickerchance:
		enabled=!enabled
	
func off():
	$Timer.stop()
	enabled=false
