extends Label

func _process(_delta):
	text = "Rain : %s" % Global.game_data.cloud_bullets_left
