extends Node


@onready var boulder: Node2D = $Boulder
@onready var planet_screen: AnimatedSprite2D = $PlanetScreen

var anomalous: bool
var grav_index: int
var severity: float


func _ready() -> void:
	anomalous = false
	grav_index = 0


func reset():
	boulder.reset()
	grav_index = 0
	anomalous = false
	severity = 0.0


func _process(delta: float) -> void:
	if anomalous:
		grav_index = randi_range(1, 2)
		print("I'm anomalous")
		anomalous = false
	match grav_index:
		0:
			boulder.gravity = 0
		1:
			boulder.gravity = 1
		2:
			boulder.gravity = 2
	severity = boulder.severity


func _on_grav_left_pressed() -> void:
	grav_index -= 1
	if grav_index == -1:
		grav_index = 2
	print("I'm pressed")


func _on_grav_right_pressed() -> void:
	grav_index += 1
	if grav_index == 3:
		grav_index = 0
	print("I'm pressed")
