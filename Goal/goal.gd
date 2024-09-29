extends Area2D
class_name Goal

## The player who will receive the score when the ball reaches this goal
@export var scores_for: GameManager.Player

func _on_ball_launched():
	set_deferred("monitoring", true)

func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		GameManager.increasePlayerScore(scores_for)
		#set_deferred("monitoring", false)
		body.reset()
