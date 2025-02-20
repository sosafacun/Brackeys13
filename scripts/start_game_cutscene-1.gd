extends Node2D

signal fade_scene

func _ready() -> void:
	_show_cut()
 
func _show_cut() -> void:
	$AnimationPlayer.play("show_cutscene")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	fade_scene.emit("res://scenes/phone_sign_in.tscn", self)
