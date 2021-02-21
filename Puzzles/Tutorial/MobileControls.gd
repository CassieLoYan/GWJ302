extends Control




func up(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		Input.action_press("forwards")


func down(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		Input.action_press("backwards")


func left(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		Input.action_press("left")


func right(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		Input.action_press("right")
