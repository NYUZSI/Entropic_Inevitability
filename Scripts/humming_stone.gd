extends Node2D

@onready var freq_select: Node2D = $FreqSelect
@onready var orange_tri: Sprite2D = $FreqSelect/OrangeTri
@onready var active_rune: Sprite2D = $ActiveRune

var severity: float
var stone_frequency
var speed = 0.1

func _ready() -> void:
	active_rune.modulate.a = 0.0
	severity = 0.0
	stone_frequency = 0


func _process(delta: float) -> void:
	if stone_frequency != 0 and freq_select.frequency != stone_frequency:
		if active_rune.modulate.a < 0.333:
			active_rune.modulate.a += speed * delta
			severity = 0.1
		if active_rune.modulate.a < 0.667 and active_rune.modulate.a > 0.333:
			active_rune.modulate.a += speed * delta
			severity = 0.4
		if active_rune.modulate.a < 1.0 and active_rune.modulate.a > 0.667:
			active_rune.modulate.a += speed * delta
			severity = 0.8
	if stone_frequency != 0 and freq_select.frequency == stone_frequency and orange_tri.position.x == orange_tri.positions[freq_select.frequency]:
		stone_frequency = 0
	if stone_frequency == 0:
		if active_rune.modulate.a > 0.0:
			active_rune.modulate.a -= 1 * delta


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tester"):
		stone_frequency = 1
