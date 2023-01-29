extends KinematicBody2D

#onready var clouder : PackedScene = preload("res://Actors/Clouders.tscn")
onready var bullet : PackedScene = preload("res://Actors/Bullets.tscn")
onready var shoot_range = get_node("autoshoot_range")
onready var clouder = load("res://Actors/Clouders.tscn")
var shoot : bool = false
var time_started : bool = false
var new_bullet 
signal hit
var called : bool = false
export var auto_shoot : bool = false
var enemies : Array = []

func _ready():
	Global.clouds_onfield += 1
	Global.game_data.cloud_center_position.append(global_position)
	if not auto_shoot :
		shoot_range.monitoring = false


func _process(_delta):
	if auto_shoot :
		if enemies :
			for enemy in enemies :
				var enemy_position = enemy.global_position
				_shoot(enemy_position)
	else :
		if not Global.dont_shoot:
			if Input.is_mouse_button_pressed(1):
				_shoot(get_global_mouse_position())


func _on_FireRate_timeout():
	shoot = true

func _shoot(target):
	$AnimationPlayer.play("shoot_cute")
	# starting timer
	if not time_started :
		$FireRate.start()
		time_started = true
		
	new_bullet = bullet.instance()
	var direction = target - global_position
	var look = target
	new_bullet.direction = direction.normalized()
	new_bullet.target = look
	if Global.game_data.cloud_bullets_left >= 1 and shoot :
		SoundM.play_shoot()
		Global.game_data.cloud_bullets_left -= 1
		add_child(new_bullet)
		shoot = false


func cloud_damaged(damage):
	emit_signal("hit",damage)


func _on_healthBar_death():
	if auto_shoot :
		get_node("autoshoot_range").monitoring = false
		enemies.clear()
	if not called :
		get_node("AnimationPlayer").stop()
		get_node("AnimationPlayer").play("die")
		called = true
		get_tree().call_group("Enemies", "change_target")
#	Global.game_data.cloud_center_position.erase(global_position)


func _on_autoshoot_range_body_entered(body):
	enemies.append(body)

func _on_autoshoot_range_body_exited(body):
	enemies.erase(body)
	
func add_clouders():	
	var new_clouder = load("res://Actors/Clouders.tscn").instance()
	new_clouder.global_position = global_position + Vector2(-10,-90)
	Global.autoshoot_for_game = auto_shoot
	get_parent().add_child(new_clouder)
	queue_free()

func lost_cloud():
#	get_node("CollisionShape2D").disabled = true
#	get_node("autoshoot_range/CollisionShape2D").disabled = true
	remove_from_group("cloud")
	Global.clouds_onfield -= 1


#func lost_cloud():
#	get_node("CollisionShape2D").disabled = true
#	get_node("autoshoot_range/CollisionShape2D").disabled = true
#	remove_from_group("cloud")
#	get_tree().call_group("Enemies", "change_target")
#	Global.clouds_onfield -= 1
