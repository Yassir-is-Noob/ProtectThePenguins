extends Node2D

#onready var SHELLSCENE = preload("KoopaNoShell.tscn")
onready var CLOUD =  load("res://Actors/CloudGun.tscn")
onready var anim_player = get_node("AnimationPlayer")
var new_cloud

signal added_cloud

func _ready():
	get_tree().call_group("Enemies", "change_target")

func _on_creatingCloudProgress_create_cloud():
	SoundM.play_add_cloud()
	anim_player.play("adding_new_cloud")
	new_cloud = CLOUD.instance()
	
	if Global.autoshoot_for_game :
		new_cloud.auto_shoot = Global.autoshoot_for_game
	else :
		new_cloud.auto_shoot = Global.autoshoot_for_game
		Global.autoshoot_for_game = false
		
	new_cloud.position = global_position

func _add_cloud():
	get_parent().add_child(new_cloud)
	emit_signal("added_cloud")
	queue_free()

func _scale_diff():
	Global.hdifficulty_scale()

func _kill_all():
	$create_cloud.queue_free()
#	$small_cloud.queue_free()
	$AnimationPlayer.queue_free()
	$creatingCloudProgress.queue_free()
	$Label.queue_free()
