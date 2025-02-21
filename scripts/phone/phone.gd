extends Control
class_name Phone

signal on_finished_scroll

func _on_sign_in_screen_finish_sign_up_process() -> void:
	await get_tree().create_timer(1).timeout
	on_finished_scroll.emit()
