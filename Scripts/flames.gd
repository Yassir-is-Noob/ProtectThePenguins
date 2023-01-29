extends Node2D
signal anim_fin
signal disable

func explosion():
	randomize()
	var x = randi()%2
	if x == 1 :
		SoundM.play_fire_death()
	else :
		SoundM.play_fire_death2()
	get_node("AnimationPlayer").play("explosion")

func _anim_finished():
	emit_signal("anim_fin")

func anim_started():
	emit_signal("disable")
