extends Node2D

signal game_finished(winner: GameManager.Player)

@onready var pause_menu: CanvasLayer = $PauseMenu

func _ready() -> void:
	GameManager.left_player_score_changed.connect(func(new_score: int): _on_player_scored(GameManager.Player.LEFT, new_score))
	GameManager.right_player_score_changed.connect(func(new_score: int): _on_player_scored(GameManager.Player.RIGHT, new_score))

func _input(event: InputEvent) -> void:
	if event.is_action("pause"):
		pause_menu._on_pause()

func _on_player_scored(player: GameManager.Player, new_score: int) -> void:
	if new_score >= GameManager.target_score:
		print("Game finished, %s player won!" % GameManager.stringifyPlayer(player))
		game_finished.emit(player)
