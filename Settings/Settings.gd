extends Control


func _process(__):
	if Input.is_action_just_pressed("ui_cancel"):
		$CanvasLayer/Panel.visible=!$CanvasLayer/Panel.visible
