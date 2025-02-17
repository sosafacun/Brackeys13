extends Node2D
class_name SpyOnScene

@export var is_day: bool

func _ready() -> void:
	if(is_day):
		%DayBackground.visible = true
	else:
		%AfternoonBackground.visible = true
