extends Node

@onready var vena: Node2D = $"Véna"
@onready var vena_2: Node2D = $"Véna2"
@onready var vena_3: Node2D = $"Véna3"
@onready var vena_4: Node2D = $"Véna4"
@onready var sargulas: Node2D = $"Sárgulás"
@onready var sargulas_2: Node2D = $"Sárgulás2"
@onready var sargulas_3: Node2D = $"Sárgulás3"
@onready var sargulas_4: Node2D = $"Sárgulás4"
@onready var sargulas_5: Node2D = $"Sárgulás5"

var anomalous: bool
var anomalies: Array
var selected_anom: Node2D
var severity: float

func _ready() -> void:
	anomalies = [vena, vena_2, vena_3, vena_4, sargulas, sargulas_2, sargulas_3, sargulas_4, sargulas_5,]
	anomalous = false


func reset():
	for anomaly in anomalies:
		anomaly.present = false
	severity = 0.0


func _process(delta: float) -> void:
	if anomalous:
		selected_anom = anomalies.pick_random()
		if selected_anom.present == true:
			selected_anom = anomalies.pick_random()
		selected_anom.present = true
		anomalous = false
	severity = vena.severity + vena_2.severity + vena_3.severity + vena_4.severity + sargulas.severity + sargulas_2.severity + sargulas_3.severity + sargulas_4.severity + sargulas_5.severity
