extends Node2D

var on: bool = false

func _ready() -> void:
	on = false


func _on_x_ray_button_pressed() -> void:
	if on == false:
		on = true
	else:
		on = false
