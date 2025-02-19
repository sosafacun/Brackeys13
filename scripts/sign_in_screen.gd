extends Control
class_name SignInScreen

signal finish_sign_up_process

func _ready() -> void:
	%PlayerNameInput.grab_focus()

func _on_continue_pressed() -> void:
	if(%PlayerNameInput.text == ""):
		pass
	else: 
		Dialogic.VAR.player.name = %PlayerNameInput.text
		_move_to_next_question(%NameContainer, %DogCatContainer, Vector2(-192, -521))

func _move_to_next_question(node_to_hide: Control, node_to_display: Control, new_position: Vector2) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.parallel().tween_property(node_to_hide, "modulate", Color(255,255,255, 0), 0.5)
	tween.parallel().tween_property(self, "position", Vector2(new_position), 0.5)
	tween.parallel().tween_property(node_to_display, "modulate", Color(255,255,255, 1), 0.5)
	pass


func _on_dog_button_pressed() -> void:
	Dialogic.VAR.player.is_pet_dog = true
	_move_to_next_question(%DogCatContainer, %StayOrGoContainer, Vector2(-192, -892))


func _on_cat_button_pressed() -> void:
	Dialogic.VAR.player.is_pet_dog = false
	_move_to_next_question(%DogCatContainer, %StayOrGoContainer, Vector2(-192, -892))


func _on_stay_in_button_pressed() -> void:
	Dialogic.VAR.player.does_stay = true
	_move_to_next_question(%StayOrGoContainer, %BigSmallContainer, Vector2(-192, -1188))


func _on_go_out_button_pressed() -> void:
	Dialogic.VAR.player.does_stay = false
	_move_to_next_question(%StayOrGoContainer, %BigSmallContainer, Vector2(-192, -1188))


func _on_big_company_button_pressed() -> void:
	Dialogic.VAR.player.works_in_big_company = true
	_move_to_next_question(%BigSmallContainer, %CongratulationsContainer, Vector2(-552, -1188))
	finish_sign_up_process.emit()

func _on_small_business_button_pressed() -> void:
	Dialogic.VAR.player.works_in_big_company = false
	_move_to_next_question(%BigSmallContainer, %CongratulationsContainer, Vector2(-552, -1188))
	finish_sign_up_process.emit()
