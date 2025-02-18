extends Node2D
class_name SpyOnScene

@export var is_day: bool

const SHADOW_OFFSET_VALUE: Vector2 = Vector2(-0.1, 0.1)
const SHADOW_DEFAULT_VALUE: Vector2 = Vector2(0.0,0.0)

const NOTEPAD_DEFAULT_POSITION:Vector2 = Vector2(-600, 428)
const NOTEPAD_SELECTED_POSITION: Vector2 = Vector2(-560, 404)

func _ready() -> void:
	if(is_day):
		%Sun.position = Vector2(-832,-1452)
		%Sun.color = Color("#fefed4")
		$".".modulate = Color("faf4ea")
	else:
		%Sun.position = Vector2(1184, -940)
		%Sun.color = Color("f94802")
		$".".modulate = Color("ffe4dd")
	
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
