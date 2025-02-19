extends CanvasLayer
class_name Game

@onready var fade_anim: AnimationPlayer = $FadeToBlackTransition/FadeAnim
@onready var scene_path: String

func _on_scene_fade(new_scene_path: String, node_to_free: Node) -> bool:
	var new_scene: Node = load(new_scene_path).instantiate()
	
	fade_anim.play("fade_to_black")
	await get_tree().create_timer(0.5).timeout
	
	$".".add_child(new_scene)
	node_to_free.queue_free()
	
	fade_anim.play("fade_to_scene")
	await get_tree().create_timer(0.5).timeout
	
	return true

func _process(_delta: float) -> void:
	var faders: Array = get_tree().get_nodes_in_group("faders")
	
	for fader:Node in faders:
		if (!fader.is_connected("fade_scene", _on_scene_fade)):
			fader.connect("fade_scene", _on_scene_fade)
