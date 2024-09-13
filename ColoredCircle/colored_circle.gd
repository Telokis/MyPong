@tool
extends Control
class_name ColoredCircle

@export var radius: float
@export var color: Color

func _ready():
	set_custom_minimum_size(2 * Vector2(radius, radius))

func _draw():
	draw_circle(Vector2(radius, radius), radius, color)
