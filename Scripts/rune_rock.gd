extends Node


@onready var humming_stone: Node2D = $HummingStone
@onready var freq_select: Node2D = $HummingStone/FreqSelect

var anomalous: bool
var severity: float

func _ready() -> void:
	anomalous = false

func reset():
	humming_stone.reset()
	freq_select.reset()
	severity = 0.0


func _process(delta: float) -> void:
	if anomalous:
		humming_stone.present = true
		anomalous = false
	severity = humming_stone.severity
