extends HBoxContainer


@export var property_label: String

func _ready() -> void:
	%PropertyLabel.text = property_label
	%PropertyValue.text = str(%SliderValue.value)


func _on_slider_value_value_changed(value: float) -> void:
	%PropertyValue.text = str(value)
