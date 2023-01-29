extends Area2D

signal hit
var damage : int
signal death_anim

func _ready():
	damage = Global.game_data.enemies_damage
	
func _on_bullets_detect_area_entered(_area): # bullet
	emit_signal("hit")
	# shake shake
#	for cam in get_tree().get_nodes_in_group("cam"):
#		cam.add_trauma(0.2)
	get_tree().call_group("cam", "add_traum")
	
	_area.queue_free()

func _on_bullets_detect_body_entered(body): # cloud	
	if body.is_in_group("penguin"):
		body.kill_penguin()
		emit_signal("death_anim")
		return 
		
	body.cloud_damaged(damage)
	emit_signal("death_anim")


func _on_flames_disable():
	$CollisionShape2D2.disabled = true
