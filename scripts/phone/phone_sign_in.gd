extends Node2D

signal fade_scene

func _on_phone_on_finished_scroll() -> void:
	fade_scene.emit("res://scenes/spy_on_scenes/FEMALE/alex _day_one_morning.tscn", self)
