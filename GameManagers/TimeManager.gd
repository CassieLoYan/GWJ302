extends Control


onready var timer = $Timer
onready var text = $Label

func stop_timer():
	var time_left = timer.time_left
	timer.stop()
	var score = time_left*200/15
	score = stepify(score,1)
	ScoreManager.increase_score(score)

func _process(__):
	text.text=str(stepify(timer.time_left,0.1))

func start_timer():
	timer.wait_time=60
	timer.start()


func _on_Timer_timeout():
	for i in get_tree().get_nodes_in_group("player"):
		i.die()
