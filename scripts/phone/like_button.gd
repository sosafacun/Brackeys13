extends Control
class_name LikeButton


func _on_texture_button_pressed() -> void:
	if($TextureButton.button_pressed):
		$TextureButton.disabled = true
		%LikeParticles.emitting = true
		await get_tree().create_timer(1).timeout
		$TextureButton.disabled = false
