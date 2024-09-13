extends Node2D

@onready var colored_circle: ColoredCircle = %ColoredCircle

const ColoredCircleScene = preload("res://ColoredCircle/colored_circle.gd")

func _ready() -> void:
	for i in range(500):
		make_point()

func make_point():
	var small_radius = 2
	var big_radius = colored_circle.radius
	var angle = _random_angle()
	var point = big_radius * Vector2.from_angle(angle)
	var offset = Vector2(big_radius, big_radius)
	var new_point = ColoredCircleScene.new()
	new_point.radius = small_radius
	new_point.color = Color.RED
	new_point.antialiased = true
	new_point.position = offset + point + Vector2(small_radius, small_radius)
	colored_circle.add_child.call_deferred(new_point)

func _random_angle() -> float:
	var random_angle = randf() * 100.0 # Generate a random angle between 0 and 100
	var hemisphere = randi() % 2 # Randomly choose hemisphere (0 for left, 1 for right)
	
	# Shift the angle based on the hemisphere
	var final_angle_deg
	if hemisphere == 0:
		final_angle_deg = random_angle + 130.0 # Left hemisphere: 130 to 230
	else:
		final_angle_deg = random_angle - 50.0 # Right hemisphere: -50 to 50
	return deg_to_rad(final_angle_deg) # Convert the final angle to radians
