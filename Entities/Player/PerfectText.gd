extends Label

onready var tween = $Tween
func show():
	tween.interpolate_property(self,"percent_visible",0,1,0.1,Tween.TRANS_ELASTIC,Tween.EASE_IN)
	tween.start()
	yield(tween,"tween_completed")
	yield(get_tree().create_timer(0.8),"timeout")
	tween.interpolate_property(self,"percent_visible",1,0,0.1,Tween.TRANS_ELASTIC,Tween.EASE_IN)
	tween.start()
