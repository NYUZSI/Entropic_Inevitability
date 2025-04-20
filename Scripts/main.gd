extends Node2D

@onready var boulder: Node2D = $"Rune/Rocks/Boulder"
@onready var background: Node2D = $Background

var grav_index = 0



func _process(delta):
	#	Gravity Control for the Boulders
	match grav_index:
		0:
			boulder.gravity = 0
		1:
			boulder.gravity = 1
		2:
			boulder.gravity = 2

func _on_x_ray_button_pressed() -> void:
	print("bring down the X-Ray!")


func _on_grav_left_pressed() -> void:
	grav_index -= 1
	if grav_index == -1:
		grav_index = 2


func _on_grav_right_pressed() -> void:
	grav_index += 1
	if grav_index == 3:
		grav_index = 0


func _on_light_switch_pressed() -> void:
	background.lights_on = true
