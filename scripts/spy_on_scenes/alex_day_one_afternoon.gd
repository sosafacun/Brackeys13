extends Node2D

signal fade_scene

func _on_aparment_scene_timeline_ended() -> void:
	#TODO: make a social media scrollable menu interlude. It should fade to that.
	fade_scene.emit("res://scenes/spy_on_scenes/FEMALE/alex_day_one_afternoon.tscn", self)
