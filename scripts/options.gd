extends Control
class_name Options

signal fade_scene

func _on_return_to_main_menu_button_pressed() -> void:
	fade_scene.emit("res://scenes/main_menu.tscn", self)
