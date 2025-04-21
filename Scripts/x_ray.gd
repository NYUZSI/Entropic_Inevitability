extends Node2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var button_press: AudioStreamPlayer = $ButtonPress

var on: bool = false

func _ready() -> void:
	on = false
	sprite_2d.modulate.r8 = 200
	sprite_2d.modulate.g8 = 200
	sprite_2d.modulate.b8 = 200


func _on_x_ray_button_pressed() -> void:
	if on == false:
		on = true
	else:
		on = false
	if not button_press.playing:
		button_press.play()


func _on_x_ray_button_mouse_entered() -> void:
	sprite_2d.modulate.r8 = 255
	sprite_2d.modulate.g8 = 255
	sprite_2d.modulate.b8 = 255


func _on_x_ray_button_mouse_exited() -> void:
	sprite_2d.modulate.r8 = 200
	sprite_2d.modulate.g8 = 200
	sprite_2d.modulate.b8 = 200
