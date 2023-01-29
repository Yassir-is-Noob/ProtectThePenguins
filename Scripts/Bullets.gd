extends Area2D

var direction : Vector2
var SPEED : int = 1000
var target : Vector2

func _ready():
	if target :
		look_at(target)
		
func _process(delta):
	if direction :
		global_position += direction * SPEED * delta
		
func _on_Bullets_body_entered(_body):
	queue_free()
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
