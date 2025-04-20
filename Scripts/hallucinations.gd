extends Node

@onready var halu: Node2D = $Halu
@onready var halu_2: Node2D = $Halu2
@onready var halu_3: Node2D = $Halu3
@onready var halu_4: Node2D = $Halu4
var halus
var selected_halu
var anomalous: bool
var severity: float

func _ready():
	anomalous = false
	halus = [halu, halu_2, halu_3, halu_4]
	halus.shuffle()


func reset():
	for halu in halus:
		halu.present = false
	severity = 0.0


func _process(delta: float) -> void:
	if anomalous:
		selected_halu = halus.pick_random()
		if selected_halu.present == true:
			selected_halu = halus.pick_random()
		selected_halu.present = true
		anomalous = false
	severity = halu.severity + halu_2.severity + halu_3.severity + halu_4.severity


func _on_light_button_pressed() -> void:
	for halu in halus:
		halu.present = false
