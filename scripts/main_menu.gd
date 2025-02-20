extends Control
class_name MainMenu

signal fade_scene

func _on_start_game_button_pressed() -> void:
	fade_scene.emit("res://scenes/start_game_cutscene-1.tscn", self)

func _on_options_pressed() -> void:
	fade_scene.emit("res://scenes/options.tscn", self)


func _on_credits_pressed() -> void:
	fade_scene.emit("res://scenes/credits.tscn", self)


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
