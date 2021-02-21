extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreManager.hide()
	MobileControlsCanvas.get_node("Control").hide()
	TimeManager.hide()
	RhythmManager.stop()
	$Label.text+="\n YOUR SCORE IS "+str(ScoreManager.score)
	
