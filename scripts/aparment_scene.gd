extends Node2D
class_name ApartmentScene

@export var timeline: DialogicTimeline

func _ready() -> void:
	Dialogic.start_timeline(timeline)
