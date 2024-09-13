extends CharacterBody2D
class_name Ball

var vector_radius : Vector2
@export_range(10, 100, 5) var radius: float = 20 :
	set(value):
		radius = value
		vector_radius = Vector2(radius, radius)
		_update_radius()
		
@export_range(10, 500, 10, "suffix:px/s") var speed: float = 100

func _ready():
	$ColoredCircle.color = Color.WHITE
	_update_radius()
	for i in range(100):
		print(rad_to_deg(_random_angle()))

func _update_radius():
	var collision_shape_2d: CollisionShape2D = $CollisionShape2D
	var colored_circle: ColoredCircle = $ColoredCircle
	
	var shape = collision_shape_2d.shape as CircleShape2D
	shape.radius = radius
	colored_circle.radius = radius

func _physics_process(delta: float) -> void:
	if (velocity == Vector2.ZERO):
		_center_ball()
		velocity = speed * Vector2.from_angle(_random_angle())
	
	var collision = move_and_collide(velocity * delta)
	
	if (collision):
		velocity = velocity.bounce(collision.get_normal())

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

func _center_ball() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	var center_position = viewport_size / 2
	position = center_position - vector_radius

func reset() -> void:
	velocity = Vector2.ZERO
	_center_ball()
