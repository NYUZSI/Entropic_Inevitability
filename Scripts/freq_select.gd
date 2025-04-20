extends Node2D

@onready var orange_tri: Sprite2D = $OrangeTri
@onready var wheel_tri: Sprite2D = $WheelTri

# 0=off, 1=1st freq..., 4=4th freq
var frequency: int
var speed = 300

func _ready() -> void:
	frequency = 0


func reset():
	frequency = 0


func _process(delta: float) -> void:
	wheel_tri.position.x = wheel_tri.positions[frequency][0]
	wheel_tri.position.y = wheel_tri.positions[frequency][1]
	wheel_tri.rotation_degrees = wheel_tri.positions[frequency][2]
	if orange_tri.position.x < orange_tri.positions[frequency]:
		orange_tri.position.x += speed * delta
		if orange_tri.position.x > orange_tri.positions[frequency]:
			orange_tri.position.x = orange_tri.positions[frequency]
	if orange_tri.position.x > orange_tri.positions[frequency]:
		orange_tri.position.x -= speed * delta
		if orange_tri.position.x < orange_tri.positions[frequency]:
			orange_tri.position.x = orange_tri.positions[frequency]


func _on_invisi_button_pressed() -> void:
	frequency += 1
	if frequency == 5:
		frequency = 0
