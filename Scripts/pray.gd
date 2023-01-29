extends Label

func _ready():
	visible = false

func _on_prayButton_mouse_entered():
	visible = true
	text = "Pray: %s" % Global.game_data.cult_pray_cost

func _on_prayButton_mouse_exited():
	visible = false


func _on_prayButton_no_clouds_detected():
	text = "No clouds detected !"
	$Timer.start()

func _on_prayButton_not_enough_coins():
	text = "Not enough coins !"
	$Timer.start()	

func _on_Timer_timeout():
	text = "Pray: %s" % Global.game_data.cult_pray_cost
