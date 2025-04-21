extends Node2D

@onready var orange_tri: Sprite2D = $OrangeTri
@onready var wheel_tri: Sprite2D = $WheelTri
@onready var freq_1: AudioStreamPlayer = $freq1ctrl
@onready var freq_2: AudioStreamPlayer = $freq2ctrl
@onready var freq_3: AudioStreamPlayer = $freq3ctrl
@onready var freq_4: AudioStreamPlayer = $freq4ctrl
@onready var wheel: Sprite2D = $Wheel

# 0=off, 1=1st freq..., 4=4th freq
var frequency: int
var speed = 300
var freqs: Array


func _ready() -> void:
	freqs = [freq_1, freq_2, freq_3, freq_4]
	frequency = 0
	wheel_tri.modulate.r8 = 200
	wheel_tri.modulate.g8 = 200
	wheel_tri.modulate.b8 = 200
	wheel.modulate.r8 = 200
	wheel.modulate.g8 = 200
	wheel.modulate.b8 = 200


func reset():
	frequency = 0
	for freq in freqs:
		freq.stop()


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
	if frequency != 0 and orange_tri.position.x == orange_tri.positions[frequency]:
		if not freqs[frequency - 1].playing:
			for freq in freqs:
				freq.stop()
			freqs[frequency - 1].play()
	if orange_tri.position.x != orange_tri.positions[frequency]:
		for freq in freqs:
			freq.stop()


func _on_invisi_button_pressed() -> void:
	frequency += 1
	if frequency == 5:
		frequency = 0


func _on_invisi_button_mouse_entered() -> void:
	wheel_tri.modulate.r8 = 255
	wheel_tri.modulate.g8 = 255
	wheel_tri.modulate.b8 = 255
	wheel.modulate.r8 = 255
	wheel.modulate.g8 = 255
	wheel.modulate.b8 = 255


func _on_invisi_button_mouse_exited() -> void:
	wheel_tri.modulate.r8 = 200
	wheel_tri.modulate.g8 = 200
	wheel_tri.modulate.b8 = 200
	wheel.modulate.r8 = 200
	wheel.modulate.g8 = 200
	wheel.modulate.b8 = 200
