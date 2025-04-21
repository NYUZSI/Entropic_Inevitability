extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.r8 = 200
	modulate.g8 = 200
	modulate.b8 = 200


func _on_napló_click_mouse_entered() -> void:
	modulate.r8 = 255
	modulate.g8 = 255
	modulate.b8 = 255


func _on_napló_click_mouse_exited() -> void:
	modulate.r8 = 200
	modulate.g8 = 200
	modulate.b8 = 200
