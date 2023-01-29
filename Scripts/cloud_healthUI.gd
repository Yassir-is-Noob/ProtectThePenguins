extends Label
var health : int

func _ready():
	health = Global.game_data.cloud_health

func _process(delta):
	text = "Health : %s" % health
