extends Control

signal scroll_ended

var is_scroll_ended: bool = false

func _ready() -> void:
	
	Shared.feed_array.shuffle()
	
	%PicOne.texture = Shared.feed_array[1]
	%PicTwo.texture = Shared.feed_array[2]
	%PicThree.texture = Shared.feed_array[3]
	
	Shared.feed_array.remove_at(1)
	Shared.feed_array.remove_at(1)
	Shared.feed_array.remove_at(1)

func _on_scroll_container_scroll_ended() -> void:
	print("scroll ended")
	if(!is_scroll_ended):
		is_scroll_ended = true
		print("timeout")
		await get_tree().create_timer(3).timeout
		print("emited signal")
		scroll_ended.emit()
