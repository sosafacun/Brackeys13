extends Node2D
class_name ApartmentScene

@export var timeline: DialogicTimeline

signal timeline_ended

func _ready() -> void:
	Dialogic.start_timeline(timeline)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	
func _on_timeline_ended() -> void:
	timeline_ended.emit()
