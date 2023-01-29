extends TextureProgress
export var mhealth :int

signal death 
signal game_over

func _ready():
	max_value = mhealth
	value = mhealth

func _on_bullets_detect_hit():
	if value > Global.game_data.cloud_damage :
		value -= Global.game_data.cloud_damage
	else :
		Global.game_data.currency += Global.game_data.enemies_worth
		Global.game_data.score += 100
		Global.edifficulty_scale()
		emit_signal("death")

func _on_Cloud_hit(damage):
	if value > damage :
		value -= damage
	else :
		value = 0
		
		emit_signal("death")

func _on_penguins_cult_got_hit():
	value -= Global.game_data.enemies_damage
	if value <= 0 :
		emit_signal("game_over")

func _on_flames_disable():
	visible = false
