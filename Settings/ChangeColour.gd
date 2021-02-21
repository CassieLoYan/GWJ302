extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var __ = connect("pressed",self,"click")

func click():
	print("clicked ",text)
	ColorManager.change_colours(text)
