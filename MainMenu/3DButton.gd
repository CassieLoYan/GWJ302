extends Spatial


export (String, "empty", "play","settings") var type

func _on_ClickDetection_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if type=="settings":
			Input.action_press("ui_cancel")
		else:
			ScoreManager.show()
			TimeManager.show()
			MobileControlsCanvas.get_node("Control").show()
			SceneManager.change_levels("res://Puzzles/Tutorial/Tutorial.tscn")
			#SceneManager.change_levels("res://Puzzles/Level12/Level.tscn")
