@tool
extends Control
class_name ColoredCircle

@export var color: Color
@export var filled: bool = true
@export var width: float = -1.0
@export var antialiased: bool = false
@export var centered: bool = true

@export var radius: float:
	set(value):
		radius = value
		_update_size()

func _ready():
	_update_size()

func _update_size():
	set_size(2 * Vector2(radius, radius))
	set_custom_minimum_size(2 * Vector2(radius, radius))
	if centered:
		set_anchors_preset(Control.LayoutPreset.PRESET_CENTER)

func _draw():
	if centered:
		draw_circle(Vector2.ZERO, radius, color, filled, width, antialiased)
	else:
		draw_circle(Vector2(radius, radius), radius, color, filled, width, antialiased)
