extends Node2D

@onready var boulder: Node2D = $"Rune*/Rocks*/Boulder"
@onready var boulder_2: Node2D = $"Rune*/Rocks*/Boulder2"
@onready var boulder_3: Node2D = $"Rune*/Rocks*/Boulder3"
@onready var boulder_4: Node2D = $"Rune*/Rocks*/Boulder4"
var boulders

var grav_index = 0

func _ready():
	boulders = [boulder, boulder_2, boulder_3, boulder_4]

func _process(delta):
	#	Gravity Control for the Boulders
	match grav_index:
		0:
			for boulder in boulders:
				boulder.gravity = 0
		1:
			for boulder in boulders:
					boulder.gravity = 1
		2:
			for boulder in boulders:
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
