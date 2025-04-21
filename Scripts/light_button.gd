extends AnimatedSprite2D

@onready var button_press: AudioStreamPlayer = $ButtonPress


func _ready() -> void:
	play("UnPressed")
	modulate.r8 = 200
	modulate.g8 = 200
	modulate.b8 = 200

func _on_light_button_pressed() -> void:
	play("Pressed")
	if not button_press.playing:
		button_press.play()


func _on_light_button_mouse_entered() -> void:
	modulate.r8 = 255
	modulate.g8 = 255
	modulate.b8 = 255


func _on_light_button_mouse_exited() -> void:
	modulate.r8 = 200
	modulate.g8 = 200
	modulate.b8 = 200
