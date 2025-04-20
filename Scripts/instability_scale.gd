extends Node2D


@onready var sub_csik: Sprite2D = $OverCsik/SubCsik

var base_x = -1000.0
var full_x = 800.0
var diff = full_x - base_x
var desired_x: float

func _ready() -> void:
	sub_csik.position.x = base_x
	visible = false

func reset():
	sub_csik.position.x = base_x
	visible = false
	


func _process(delta: float) -> void:
	if sub_csik.position.x < desired_x:
		sub_csik.position.x += 500 * delta
		if sub_csik.position.x > desired_x:
			sub_csik.position.x = desired_x
