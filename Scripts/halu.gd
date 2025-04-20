extends Node2D

var present: bool = false
var severity: float = 0.0

func _ready() -> void:
	modulate.a = 0.0
	present = false

func _process(delta: float) -> void:
	if present == true:
		modulate.a += 0.3 * delta
		modulate.a = clampf(modulate.a, 0.0, 0.5)
		severity += 0.05 * delta
		severity = clampf(severity, 0.0, 1.0)
	else:
		modulate.a = 0
		severity = 0.0
