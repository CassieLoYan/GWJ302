extends Spatial

signal full

func get_presses(__):
	for i in get_children():
		if !i.pressed:
			return false
	emit_signal("full",true)
	return true
