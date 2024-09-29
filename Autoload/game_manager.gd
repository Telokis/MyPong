extends Node

signal left_player_score_changed(new_score: int)
signal right_player_score_changed(new_score: int)

enum Player {
	LEFT = 0,
	RIGHT = 1
}

var score_left = 0
var score_right = 0

var target_score = 5

func getPlayerScore(player: Player) -> int:
	if player == Player.LEFT:
		return score_left
	return score_right

func setPlayerScore(player: Player, score: int) -> void:
	if player == Player.LEFT:
		score_left = score
		left_player_score_changed.emit(score_left)
	else:
		score_right = score
		right_player_score_changed.emit(score_right)

func increasePlayerScore(player: Player, increase: int = 1) -> void:
	setPlayerScore(player, getPlayerScore(player) + increase)

func stringifyPlayer(player: Player) -> String:
	if player == Player.LEFT:
		return "left"
	return "right"
