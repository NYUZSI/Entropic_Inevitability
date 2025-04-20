extends Node2D

enum Position{LEFT, RIGHT}
@export var placement: Position

@onready var sprayer: Node2D = $"../Sprayer"
@onready var x_ray: Node2D = $"../X-Ray"


var present: bool
var severity: float = 0.0
var sprayed: bool = false

func _ready() -> void:
	modulate.a = 0.0
	present = false

func _process(delta: float) -> void:
	if x_ray.on == false:
		visible = false
	else:
		visible = true
	if present == true:
		modulate.a += 0.5 * delta
		modulate.a = clampf(modulate.a, 0.0, 0.7)
		severity += 0.05 * delta
		severity = clampf(severity, 0.0, 1.0)
		if placement == Position.RIGHT:
			if sprayer.active == true:
				if sprayer.pos == 1:
					if sprayer.pipecolor == 1:
						modulate.a -= 3 * delta
						if modulate.a <= 0.01:
							present = false
		if placement == Position.LEFT:
			if sprayer.active == true:
				if sprayer.pos == 0:
					if sprayer.pipecolor == 1:
						modulate.a -= 3 * delta
						if modulate.a <= 0.01:
							present = false
	if present == false:
		modulate.a = 0.0
		clamp(modulate.a, 0.0, 0.9)
		severity = 0.0
