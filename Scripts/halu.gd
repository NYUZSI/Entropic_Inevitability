extends Node2D

var present: bool = false
var severity: float = 0.0

func _ready() -> void:
	modulate.a8 = 0

func _process(delta: float) -> void:
	if present == true:
		modulate.a8 += 50 * delta
		if severity <= 1.0:
			severity += 0.05 * delta
			if severity > 1.0:
				severity = 1.0
	if present == false:
		modulate.a8 = 0
		severity = 0.0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tester"):
		present = true
