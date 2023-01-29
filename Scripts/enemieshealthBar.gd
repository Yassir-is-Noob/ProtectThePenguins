extends TextureProgress

signal death 
#signal game_over

func _ready():
	max_value = Global.game_data.enemies_health
	value = max_value

func _on_bullets_detect_hit():
	if value > Global.game_data.cloud_damage :
		value -= Global.game_data.cloud_damage
	else :
		value = 0
		$AnimationPlayer.play("bar_death")
		Global.game_data.currency += Global.game_data.enemies_worth
		Global.game_data.score += 100
		Global.edifficulty_scale()
		emit_signal("death")
