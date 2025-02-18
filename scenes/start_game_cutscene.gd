extends Node2D


@onready var cuts: Array[Sprite2D] = [%"Cut1-scene1", %"Cut1-scene2", %"Cut1-scene3", %"Cut1-scene4"]
@onready var cut_positions: Array[Vector2] = [Vector2(-480, -228), Vector2(-336, 100), Vector2(616, -124), Vector2(544, 212)]
@onready var cut_index: int = 0

func _ready() -> void:
	for cut: Sprite2D in cuts:
		cut.modulate=Color(255,255,255, 0)
	%AwaitFrameTime.start()
	
 
func _show_cut() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.parallel().tween_property(cuts[cut_index], "modulate", Color(255,255,255, 1), 1)
	tween.parallel().tween_property(cuts[cut_index], "position", cut_positions[cut_index], 0.5)
	pass

func _on_await_frame_time_timeout() -> void:
	if(cut_index < 4):
		_show_cut()
		cut_index += 1
	else:
		%AwaitFrameTime.stop()
		_show_sign_in()

func _show_sign_in() -> void:
	var tween: Tween = get_tree().create_tween()
	
	for cut: Sprite2D in cuts:
		tween.tween_property(cut, "modulate", Color(255,255,255, 0), 0.15)
		tween.tween_property(cut, "visible", false, 0.15)
	
	tween.tween_property($ColorRect, "modulate", Color(35,35,35, 0), 0.70)
	tween.tween_property($ColorRect, "visible", false, 0.70)
