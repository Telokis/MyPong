@tool
extends Control
class_name ColoredCircle

@export var color: Color
@export var filled: bool = true
@export var width: float = -1.0
@export var antialiased: bool = false

@export var radius: float:
	set(value):
		radius = value
		_update_size()

func _ready():
	_update_size()

func _update_size():
	set_size(2 * Vector2(radius, radius))
	set_custom_minimum_size(2 * Vector2(radius, radius))

func _draw():
	draw_circle(Vector2(radius, radius), radius, color, filled, width, antialiased)
