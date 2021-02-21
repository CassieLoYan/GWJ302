extends Button




func _on_Open_pressed():
	Input.action_press("ui_cancel")


func _on_Reset2_pressed():
	SceneManager.restart_level()
