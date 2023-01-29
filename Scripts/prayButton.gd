extends Button

signal not_enough_coins
signal no_clouds_detected

func _on_prayButton_button_down():
	if Global.clouds_onfield >= 1 :
		if Global.game_data.currency >= Global.game_data.cult_pray_cost :
			Global.game_data.currency -= Global.game_data.cult_pray_cost
			Global.game_data.cloud_bullets_left += (5 * len(Global.game_data.cloud_center_position))
			get_tree().call_group("penguin", "_on_prayButton_button_up")
		else :
			emit_signal("not_enough_coins")
	else :
		emit_signal("no_clouds_detected")
		get_tree().call_group("AddingPenguins", "stop")

func _on_prayButton_mouse_entered():
	Global.dont_shoot = true

func _on_prayButton_mouse_exited():
	Global.dont_shoot = false
