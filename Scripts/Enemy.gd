extends KinematicBody2D

var target : Vector2
var velocity : Vector2 = Vector2.ZERO
var speed : int = 80
var clouds_numbers : int

#
#func _ready():
#	randomize()
#	clouds_numbers = len(Global.game_data.cloud_center_position)
#	_pick_target()

var positions = []

func _ready():
	change_target()
	SoundM.play_fire_idle()
#	for i in penguins :
#		positions.append(i.global_position)	
	
func _process(_delta):
	
	
	speed = Global.game_data.enemies_speed
	velocity = (target - position).normalized() * speed
	velocity = move_and_slide(velocity)
		
#	if target in positions and Global.clouds_onfield > 0 :
#		change_target()k
#		print("test", clouds_numbers, len(Global.game_data.cloud_center_position))
#		_pick_target()
#
func _on_healthBar_death():
	get_node("flames").explosion()

func _on_bullets_detect_death_anim():
	get_node("flames").explosion()

func change_target():
	randomize()
	
#	var penguins : Array
#	var clouds : Array
#	for p in  get_tree().get_nodes_in_group("penguin"):
#		penguins.append(p)
#	for c in get_tree().get_nodes_in_group("cloud"):
#		clouds.append(c)
	var penguins = get_tree().get_nodes_in_group("penguin")
	var clouds = get_tree().get_nodes_in_group("cloud")
	
#	if len(Global.game_data.cloud_center_position) >= 1 and Global.clouds_onfield >= 1 :
#		var picked_turret = randi() % len(Global.game_data.cloud_center_position)
#		target = Global.game_data.cloud_center_position[picked_turret]
#	else :
#		if len(penguins) == 1 :
#			target = penguins[0].global_position
#		elif len(penguins) == 0 :
#			_on_healthBar_death()
#			Global.game_over()
#		else :
#			var picked_penguin = randi() % len(penguins)
#			target = penguins[picked_penguin].global_position
	var picked_target : int
	
#	print(penguins, "  pengs,  ", penguins.size())
#	print(clouds, "  clouds,  ", clouds.size())
	if clouds.size() != 0 :
		picked_target = randi() % clouds.size()
		target = clouds[picked_target].global_position
	else :
		if penguins.size() != 0 :
			picked_target = randi() % penguins.size()
			target = penguins[picked_target].global_position
		else :
			Global.game_over()


func _on_flames_anim_fin():
	queue_free()

func _on_flames_disable():
	$CollisionShape2D.disabled = true
