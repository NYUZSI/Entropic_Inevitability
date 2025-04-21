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
@onready var light_sound: AudioStreamPlayer = $LightSound
@onready var power_down: AudioStreamPlayer = $PowerDown
@onready var sprinkler: AnimatedSprite2D = $Pond/Trees/Sprayer/Sprinkler
@onready var bgm: AudioStreamPlayer = $BGM

var timehelper: bool
var anomalies: Array
var selected_anomaly: Node
var severity: float
var instability_counter: float
var start: bool
var resetting: bool
var anomtime: float

func _ready() -> void:
	anomalies = [hallucinations, trees, rune_rock, rocks, cabin]
	anomalies.shuffle()
	timehelper = false
	resetting = false
	severity = 0.0
	instability_counter = 0.0
	anomtime = 4.0


func reset():
	resetting = true
	bgm.stop()
	cabin.playing = false
	rune_rock.stop_sounds()
	cabin.stop_sounds()
	sprinkler.playable = false
	sprinkler.watering.stop()
	power_down.play()
	background.lights_off()
	await get_tree().create_timer(5).timeout
	get_tree().reload_current_scene()



func _process(delta: float) -> void:
	if start == true:
		if timehelper == false:
			timehelper = true
			await get_tree().create_timer(anomtime).timeout
			timehelper = false
			selected_anomaly = anomalies.pick_random()
			selected_anomaly.anomalous = true
		severity = hallucinations.severity + trees.severity + rune_rock.severity + rocks.severity + cabin.severity
		if instability_counter < 50.00:
			instability_counter += severity * 0.4 * delta
		else:
			instability_counter += severity * 0.5 * delta
			if anomtime != 2.0:
				anomtime = 2.0
		instability_counter = clampf(instability_counter, 0.0, 100.0)
		if instability_counter == 100.00:
			if not resetting:
				reset()
	instability_scale.desired_x = instability_scale.base_x + instability_scale.diff * (instability_counter * 0.01)


func _on_light_switch_pressed() -> void:
	background.lights_on()
	for i in range(3):
		if light_sound.playing:
			light_sound.stop()
		if not light_sound.playing:
			light_sound.play()
		await get_tree().create_timer(1).timeout
	instability_scale.visible = true
	bgm.play()
	start = true
