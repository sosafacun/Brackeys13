extends VBoxContainer
class_name SignInScreen

func _on_continue_pressed() -> void:
	Dialogic.VAR.player.name = %PlayerNameInput.text
	_move_to_next_question(%NameInput, %DogOrCat, -220)

func _move_to_next_question(node_to_hide: VBoxContainer, node_to_display: VBoxContainer, new_position: float) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(node_to_hide, "modulate", Color(255,255,255, 0), 0.5)
	tween.tween_property(self, "position", Vector2(-192, new_position), 0.5)
	tween.tween_property(node_to_display, "modulate", Color(255,255,255, 1), 0.5)
	pass


func _on_dog_button_pressed() -> void:
	Dialogic.VAR.player.pet = true
	_move_to_next_question(%DogOrCat, %StayOrGo, -396)


func _on_cat_button_pressed() -> void:
	Dialogic.VAR.player.pet = false
	_move_to_next_question(%DogOrCat, %StayOrGo, -396)


func _on_stay_in_button_pressed() -> void:
	Dialogic.VAR.player.stay_or_go = true
	_move_to_next_question(%StayOrGo, %BigOrSmallCompany, -580)


func _on_go_out_button_pressed() -> void:
	Dialogic.VAR.player.stay_or_go = false
	_move_to_next_question(%StayOrGo, %BigOrSmallCompany, -580)
