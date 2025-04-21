extends Node2D

@onready var background: Node2D = $Background
@onready var hallucinations: Node = $Pond/Hallucinations
@onready var trees: Node = $Pond/Trees
@onready var rune_rock: Node = $Rune/RuneRock
@onready var rocks: Node = $Rune/Rocks
@onready var cabin: Node = $Cabin
@onready var kar: AnimatedSprite2D = $LightSwitch/Kar
@onready var light_switch: Button = $LightSwitch/Kar/LightSwitch
@onready var instability_scale: Node2D = $Camera2D/InstabilityScale

var timehelper: bool
var anomalies: Array
var selected_anomaly: Node
var severity: float
var instability_counter: float
var start: bool

func _ready() -> void:
	anomalies = [hallucinations, trees, rune_rock, rocks, cabin]
	anomalies.shuffle()
	timehelper = false
	severity = 0.0
	instability_counter = 0.0


func reset():
	anomalies = [hallucinations, trees, rune_rock, rocks, cabin]
	for anomaly in anomalies:
		anomaly.reset()
	kar.reset()
	light_switch.reset()
	for i in range(3):
		background.reset()
	instability_scale.reset()
	anomalies.shuffle()
	timehelper = false
	background.lights_on = false
	severity = 0.0
	instability_counter = 0.0


func _process(delta: float) -> void:
	if start == true:
		if timehelper == false:
			timehelper = true
			await get_tree().create_timer(5).timeout
			timehelper = false
			selected_anomaly = anomalies.pick_random()
			selected_anomaly.anomalous = true
		severity = hallucinations.severity + trees.severity + rune_rock.severity + rocks.severity + cabin.severity
		if instability_counter < 50.00:
			instability_counter += severity * 0.2 * delta
		else:
			instability_counter += severity * 0.5 * delta
		instability_counter = clampf(instability_counter, 0.0, 100.0)
		if instability_counter == 100.00:
			reset()
	instability_scale.desired_x = instability_scale.base_x + instability_scale.diff * (instability_counter * 0.01)


func _on_light_switch_pressed() -> void:
	background.lights_on = true
	await get_tree().create_timer(12).timeout
	instability_scale.visible = true
	start = true
