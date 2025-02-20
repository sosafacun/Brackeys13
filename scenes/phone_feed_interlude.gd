extends Node2D

signal fade_scene

@export var next_scene: String

func _ready() -> void:
	fade_scene.emit(next_scene, self)
