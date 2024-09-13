@tool
extends Control

func _draw():
	var center = size / 2
	var radius = min(size.x, size.y) / 2
	draw_circle(center, radius, Color.WHITE)
