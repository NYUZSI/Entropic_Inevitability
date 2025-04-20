extends AnimatedSprite2D

func _ready() -> void:
	play("Dark")


func reset():
	play("Dark")


func _on_light_switch_pressed() -> void:
	play("Light")
