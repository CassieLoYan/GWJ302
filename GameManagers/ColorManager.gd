extends Node

onready var colours = preload("res://1Bitshader.tres")

var palettes = {
	"WILD":{
		"DARK":Color(0.078431, 0.133333, 0.25098),
		"LIGHT":Color(0.980392, 0.380392, 0.286275)
	},
	"DEFAULT":{
		"DARK":Color(0.133333, 0.137255, 0.137255),
		"LIGHT":Color(0.941176, 0.964706, 0.941176)
	},
	"NOKIA":{
		"DARK":Color(0.262745, 0.321569, 0.239216),
		"LIGHT":Color(0.780392, 0.941176, 0.847059)
	},
	"MANGA":{
		"DARK":Color(0.090196, 0.070588, 0.098039),
		"LIGHT":Color(0.94902, 0.984314, 0.921569)
	},
	"NOIRE":{
		"DARK":Color(0.117647, 0.109804, 0.196078),
		"LIGHT":Color(0.776471, 0.729412, 0.67451)
	}
}

var selected_colour = "DEFAULT"

func _ready():
	set_colours()

func change_colours(n_c):
	selected_colour=n_c
	set_colours()

func set_colours():
	colours.set_shader_param("dark_colour",palettes[selected_colour]["DARK"])
	colours.set_shader_param("light_colour",palettes[selected_colour]["LIGHT"])
