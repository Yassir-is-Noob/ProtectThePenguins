extends Label

func _ready():
	visible = false

func _on_create_cloud_mouse_entered():
	visible = true
	text = "add cloud : %s" % Global.game_data.cloud_price


func _on_create_cloud_mouse_exited():
	visible = false


func _on_create_cloud_not_enough_prayers():
	text = "Not enough prayers !"
