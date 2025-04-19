extends ColorRect

var on = false

func _ready() -> void:
	modulate.a8 = 0


func _process(delta: float) -> void:
	if on == true:
		modulate.a8 -= 100 * delta

func _on_light_button_pressed() -> void:
	modulate.a8 = 230
	on = true
