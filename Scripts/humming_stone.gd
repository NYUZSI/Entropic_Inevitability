extends Node2D

@onready var freq_select: Node2D = $FreqSelect
@onready var orange_tri: Sprite2D = $FreqSelect/OrangeTri
@onready var active_rune: Sprite2D = $ActiveRune
@onready var freq_1: AudioStreamPlayer = $FreqSelect/freq1stone
@onready var freq_2: AudioStreamPlayer = $FreqSelect/freq2stone
@onready var freq_3: AudioStreamPlayer = $FreqSelect/freq3stone
@onready var freq_4: AudioStreamPlayer = $FreqSelect/freq4stone
@onready var wheel: Sprite2D = $FreqSelect/Wheel

var severity: float
var present: bool
var stone_frequency: int
var speed = 0.1
var hum: bool
var freqs: Array

func _ready() -> void:
	freqs = [freq_1, freq_2, freq_3, freq_4]
	active_rune.modulate.a = 0.0
	severity = 0.0
	stone_frequency = 0
	hum = false


func reset():
	active_rune.modulate.a = 0.0
	severity = 0.0
	stone_frequency = 0
	hum = false


func _process(delta: float) -> void:
	if stone_frequency != 0 and freq_select.frequency != stone_frequency:
		hum = true
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
		hum = false
		if active_rune.modulate.a > 0.0:
			active_rune.modulate.a -= 1 * delta
		severity = 0.0
	if present:
		stone_frequency = randi_range(1, 4)
		hum = true
		present = false
	if hum:
		if not freqs[stone_frequency - 1].playing:
			for freq in freqs:
				freq.stop()
			freqs[stone_frequency - 1 ].play()
	if not hum:
		for freq in freqs:
			freq.stop()
