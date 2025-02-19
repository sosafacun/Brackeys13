extends Node2D

signal fade_scene


func _on_aparment_scene_timeline_ended() -> void:
	fade_scene.emit("res://scenes/main_menu.tscn", self)
