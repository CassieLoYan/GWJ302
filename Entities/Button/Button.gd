extends Area

signal pressed
var pressed


func press(body):
	if body.get_parent() is Entity and !pressed:
		pressed=true
		#yield(get_tree().create_timer(0.1),"timeout")
		emit_signal("pressed",true)

func leave(body):
	if body.get_parent() is Entity and pressed:
		pressed = false
		#yield(get_tree().create_timer(0.1),"timeout")
		emit_signal("pressed",true)
