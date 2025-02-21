extends Node2D

signal fade_scene

@export var next_scene: String

func _on_phone_feed_scroll_ended() -> void:
	print("fading to the next scene")
	fade_scene.emit(next_scene, self)
