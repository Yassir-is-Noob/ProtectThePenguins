extends Camera2D

export var decay : float = 0.8
export var max_offset : Vector2 = Vector2(100,75)
export var max_rot : float = 0.1
export(NodePath) var target

var trauma = 0
var trauma_power = 2

func _ready():
	randomize()

func add_trauma():
	trauma = min(trauma + 0.2, 0.3)

func _process(delta):
	if trauma :
		trauma = max(trauma - decay * delta , 0)
		shake()

func shake():
	randomize()
	var amount = pow(trauma, trauma_power)
	rotation = max_rot * amount * rand_range(-1,1)
	offset.x = max_offset.x * amount * rand_range(-1,1)
	offset.y = max_offset.y * amount * rand_range(-1,1)
