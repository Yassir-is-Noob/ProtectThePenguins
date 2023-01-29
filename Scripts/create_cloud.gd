extends Button

var cost : int = 100
signal add_cloud
signal not_enough_prayers

func _on_create_cloud_button_down():
	SoundM.play_button()
	if Global.game_data.currency >= cost :
		Global.game_data.currency -= cost
		emit_signal("add_cloud")
	else :
		emit_signal("not_enough_prayers")

func _on_create_cloud_mouse_entered():
	Global.dont_shoot = true


func _on_create_cloud_mouse_exited():
	Global.dont_shoot = false
