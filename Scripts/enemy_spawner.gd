extends Path2D

onready var spawn_rate = get_node("Timer")
onready var enemies : PackedScene = preload("res://Actors/EnemyA.tscn")
onready var enemies2 : PackedScene = preload("res://Actors/EnemyB.tscn")

onready var spawn_location = get_node("PathFollow2D")
var penguins : Array
func _ready():
	$Timer.start()


func _process(_delta):
	if not Global.enemies_spawn :
		$Timer.stop()
	if Global.game_data.enemies_spawn_rate > 0.3 :
		spawn_rate.wait_time = Global.game_data.enemies_spawn_rate

func _on_Timer_timeout():
	spawn()

func spawn():
	# also randomize enemies types
	for i in get_tree().get_nodes_in_group("penguin"):
		penguins.append(i)
#	penguins = get_tree().get_nodes_in_group("penguin")
	var new_enemy
	randomize()
	if (randi()%2) == 0 :
		new_enemy = enemies.instance()
	else :
		new_enemy = enemies2.instance()
		
	spawn_location.unit_offset = randf()
	new_enemy.position = spawn_location.position
#	var wanted_target = _pick_target() 
#	if wanted_target:
#		new_enemy.target = wanted_target
	if penguins.size() > 0 :
		
		add_child(new_enemy)
	else :
		print(penguins)
#
#func _pick_target():
#	randomize()
#	var target
#	if len(Global.game_data.cloud_center_position) >= 1 :
#		var picked_cloud = randi() % len(Global.game_data.cloud_center_position)
#		target = Global.game_data.cloud_center_position[picked_cloud]
#	else :
#		var penguins = get_tree().get_nodes_in_group("penguin")
#		if len(penguins) == 1 :
#			target = penguins[0].global_position
#		elif len(penguins) == 0 :
#			return 
#		else :
#			var picked_peguin = randi() % len(penguins)
#			target = penguins[picked_peguin].global_position
#	return target
