extends Node2D


@onready var pipes: AnimatedSprite2D = $Pipes
@onready var sprinkler: AnimatedSprite2D = $Sprinkler
var active = false
var pos = 1
var pipecolor

func _ready() -> void:
	pipecolor = pipes.pipecolor

func _process(delta: float) -> void:
	if pos != sprinkler.desiredpos:
		sprinkler.desiredpos = pos
	if active != sprinkler.active:
		sprinkler.active = active
		

func _on_green_button_pressed() -> void:
	if active == false:
		pipes.pipecolor = 0
		pipecolor = pipes.pipecolor


func _on_red_button_pressed() -> void:
	if active == false:
		pipes.pipecolor = 1
		pipecolor = pipes.pipecolor


func _on_activator_pressed() -> void:
	if active == false:
		active = true
		await get_tree().create_timer(3.0).timeout
		active = false
	else:
		active = false


func _on_left_mover_pressed() -> void:
	if pos != 0:
		pos = 0


func _on_right_mover_pressed() -> void:
	if pos != 1:
		pos = 1
