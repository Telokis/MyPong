extends Label

@export var player: GameManager.Player

func _ready() -> void:
	_on_player_score_changed(GameManager.getPlayerScore(player))
	
	if (player == GameManager.Player.LEFT):
		GameManager.left_player_score_changed.connect(_on_player_score_changed)
	else:
		GameManager.right_player_score_changed.connect(_on_player_score_changed)

func _on_player_score_changed(new_score: int) -> void:
	text = "%d" % new_score
