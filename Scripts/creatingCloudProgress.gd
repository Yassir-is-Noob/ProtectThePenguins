extends TextureProgress
signal create_cloud

func _ready():
	max_value = 10
	step = 1
	
func _on_create_cloud_add_cloud():
	value += 1

func _process(_delta):
	if value == max_value :
		emit_signal("create_cloud")
