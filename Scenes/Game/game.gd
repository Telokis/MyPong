extends Node2D

@onready var pause_menu: CanvasLayer = $PauseMenu

func _input(event: InputEvent) -> void:
	if event.is_action("pause"):
		pause_menu._on_pause()
