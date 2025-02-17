extends Control
class_name MainMenu 

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("../scenes/start_game_cutscene.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("../scenes/options.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("../scenes/credits.tscn")


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
