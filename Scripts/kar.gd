extends AnimatedSprite2D

func _ready() -> void:
	play("Dark")
	modulate.r8 = 200
	modulate.g8 = 200
	modulate.b8 = 200


func reset():
	play("Dark")


func _on_light_switch_pressed() -> void:
	play("Light")


func _on_light_switch_mouse_entered() -> void:
	modulate.r8 = 255
	modulate.g8 = 255
	modulate.b8 = 255


func _on_light_switch_mouse_exited() -> void:
	modulate.r8 = 200
	modulate.g8 = 200
	modulate.b8 = 200
