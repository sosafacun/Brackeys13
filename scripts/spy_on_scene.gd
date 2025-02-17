extends Node2D
class_name SpyOnScene

@export var is_day: bool

const SHADOW_OFFSET_VALUE: Vector2 = Vector2(-0.1, 0.1)
const SHADOW_DEFAULT_VALUE: Vector2 = Vector2(0.0,0.0)

const NOTEPAD_DEFAULT_POSITION:Vector2 = Vector2(-696, 324)
const NOTEPAD_SELECTED_POSITION: Vector2 = Vector2(-676, 304)

func _ready() -> void:
	if(is_day):
		%DayBackground.visible = true
	else:
		%AfternoonBackground.visible = true
	
	Dialogic.Text.meta_clicked.connect(_on_text_clicked)

func _on_notepad_mouse_entered() -> void:
	%NotepadSprite.material.set_shader_parameter("shadow_offset", SHADOW_OFFSET_VALUE)
	_select_notepad(NOTEPAD_SELECTED_POSITION)
	
	
func _on_notepad_mouse_exited() -> void:
	%NotepadSprite.material.set_shader_parameter("shadow_offset", SHADOW_DEFAULT_VALUE)
	_select_notepad(NOTEPAD_DEFAULT_POSITION)

func _on_notepad_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if(Input.is_action_just_pressed("interact")):
		print("notepad pressed")

func _select_notepad(new_notepad_position: Vector2) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.parallel().tween_property(%Notepad, "position", new_notepad_position, 0.05)
	

func _on_text_clicked(meta: Variant) -> void:
	var info: String = str(meta)
	var entry:Dictionary = Dialogic.Glossary.get_entry(info)
	
	if(entry.has("text")):
		print(entry["text"])
