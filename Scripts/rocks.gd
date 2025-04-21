extends Node


@onready var boulder: Node2D = $Boulder
@onready var planet_screen: AnimatedSprite2D = $PlanetScreen
@onready var left: Sprite2D = $Left
@onready var right: Sprite2D = $Right
@onready var button_press: AudioStreamPlayer = $ButtonPress

var anomalous: bool
var grav_index: int
var severity: float


func _ready() -> void:
	anomalous = false
	grav_index = 0
	left.modulate.r8 = 200
	left.modulate.g8 = 200
	left.modulate.b8 = 200
	right.modulate.r8 = 200
	right.modulate.g8 = 200
	right.modulate.b8 = 200


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
	if not button_press.playing:
		button_press.play()


func _on_grav_right_pressed() -> void:
	grav_index += 1
	if grav_index == 3:
		grav_index = 0
	print("I'm pressed")
	if not button_press.playing:
		button_press.play()


func _on_grav_left_mouse_entered() -> void:
	left.modulate.r8 = 255
	left.modulate.g8 = 255
	left.modulate.b8 = 255


func _on_grav_left_mouse_exited() -> void:
	left.modulate.r8 = 200
	left.modulate.g8 = 200
	left.modulate.b8 = 200


func _on_grav_right_mouse_entered() -> void:
	right.modulate.r8 = 255
	right.modulate.g8 = 255
	right.modulate.b8 = 255


func _on_grav_right_mouse_exited() -> void:
	right.modulate.r8 = 200
	right.modulate.g8 = 200
	right.modulate.b8 = 200
