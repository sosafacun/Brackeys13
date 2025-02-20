extends Node2D
class_name Level

signal fade_scene

@export var is_alex_scene: bool
@onready var variable_path: String

func _on_aparment_scene_timeline_ended() -> void:
	#TODO: make a social media scrollable menu interlude. It should fade to that.
	fade_scene.emit("res://scenes/main_menu.tscn", self)
	
func _ready() -> void:
	if(is_alex_scene):
		variable_path = "{FEMALE."
	else:
		variable_path = "{MALE."
	Dialogic.Text.meta_clicked.connect(_on_text_clicked)
	

func _on_text_clicked(meta: String) -> void:
	print(meta)
