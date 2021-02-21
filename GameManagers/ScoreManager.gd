extends Control


var score = 0
onready var label = $Label
func _ready():
	set_score_text()

func set_score_text():
	var score_size = str(score).length()
	var score_text : String = ""
	for i in 6-score_size:
		score_text+="0"
	score_text+=str(score)
	label.text=score_text

func increase_score(amount):
	score+=amount
	set_score_text()
