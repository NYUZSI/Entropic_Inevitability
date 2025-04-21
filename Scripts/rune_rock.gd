extends Node


@onready var humming_stone: Node2D = $HummingStone
@onready var freq_select: Node2D = $HummingStone/FreqSelect
@onready var freq_1_stone: AudioStreamPlayer = $HummingStone/FreqSelect/freq1stone
@onready var freq_2_stone: AudioStreamPlayer = $HummingStone/FreqSelect/freq2stone
@onready var freq_3_stone: AudioStreamPlayer = $HummingStone/FreqSelect/freq3stone
@onready var freq_4_stone: AudioStreamPlayer = $HummingStone/FreqSelect/freq4stone
@onready var freq_1_ctrl: AudioStreamPlayer = $HummingStone/FreqSelect/freq1ctrl
@onready var freq_2_ctrl: AudioStreamPlayer = $HummingStone/FreqSelect/freq2ctrl
@onready var freq_3_ctrl: AudioStreamPlayer = $HummingStone/FreqSelect/freq3ctrl
@onready var freq_4_ctrl: AudioStreamPlayer = $HummingStone/FreqSelect/freq4ctrl

var anomalous: bool
var severity: float
var freqs: Array

func _ready() -> void:
	anomalous = false
	freqs = [freq_1_ctrl, freq_1_stone, freq_2_ctrl, freq_2_stone, freq_3_ctrl, freq_3_stone, freq_4_ctrl, freq_4_stone]

func stop_sounds():
	humming_stone.playable = false
	freq_select.playable = false
	for freq in freqs:
		freq.stop()


func _process(delta: float) -> void:
	if anomalous:
		humming_stone.present = true
		anomalous = false
	severity = humming_stone.severity
