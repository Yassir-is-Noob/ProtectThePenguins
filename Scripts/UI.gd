extends CanvasLayer

onready var currency = get_node("currency")
onready var score = get_node("score")

func _process(_delta):
	currency.text = "prayers : %s"% Global.game_data.currency
	score.text = "score : %s"% Global.game_data.score	
