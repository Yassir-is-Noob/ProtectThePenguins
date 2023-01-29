extends Label
var health : int

func _ready():
	health = Global.game_data.cult_health
	
func _process(delta):
	text = "Health : %s" % health


func _on_prayButton_mouse_entered():
	visible = true

func _on_prayButton_mouse_exited():
	visible = false
