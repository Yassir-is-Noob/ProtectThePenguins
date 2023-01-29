extends Label
onready var anim_player = get_node("AnimationPlayer")
var play : bool = false

func press_clouder():
	text = "click on the small cloud"
	anim_player.play("normal_anim")

func add_prayers():
	play = true
	text = "click on penguins for rain prayers"
	anim_player.play("press_enemies")

func press_enemies():
	text = "now extinguishe the fire"
	anim_player.play("gameplay_time")

func _process(delta):
	if play :
		if Global.game_data.score >= 800 or len(Global.game_data.cloud_center_position) < 1:
			anim_player.play("Tut_finished")

func back_to_main_menu():
	get_tree().change_scene("res://Templates/start_menu.tscn")
