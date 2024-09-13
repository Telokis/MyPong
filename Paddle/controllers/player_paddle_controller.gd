extends Node
class_name PlayerPaddleController

@export var paddle: CharacterBody2D
@export_range(10, 500, 10, "suffix:px/s") var speed: float = 100
@export var up_input: String
@export var down_input: String

func _physics_process(delta: float) -> void:
	if (paddle):
		var vec = Vector2(0, Input.get_action_strength(down_input) - Input.get_action_strength(up_input))
		paddle.velocity = vec * speed
		paddle.move_and_collide(paddle.velocity * delta)
