extends AnimatedSprite2D



func _ready() -> void:
	play("UnPressed")

func _on_light_button_pressed() -> void:
	play("Pressed")
