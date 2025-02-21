extends Node2D
class_name Level

signal fade_scene

@export var is_alex_scene: bool
@export var next_scene: String
@onready var variable_path: String

func _on_aparment_scene_timeline_ended() -> void:
	#TODO: make a social media scrollable menu interlude. It should fade to that.
	fade_scene.emit(next_scene, self)
	
func _ready() -> void:
	if(is_alex_scene):
		variable_path = "{FEMALE."
	else:
		variable_path = "{MALE."
	Dialogic.Text.meta_clicked.connect(_on_text_clicked)

func _on_text_clicked(meta: String) -> void:
	var variable: String = variable_path+meta+"}"
	
	if(Dialogic.VAR.get_variable(variable) < 3):
		Dialogic.VAR.set_variable(variable, +1)
		
		var entry: Dictionary = Dialogic.Glossary.get_entry(meta)
		if(entry.has("text")):
			#Notebook.add_entry(entry["text"])
			pass
	else:
		#Notebook.add_entry(Dialogic.Glossary.get_entry(meta+"complete"))
		pass
