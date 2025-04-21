extends Node2D

@onready var darkleft: ColorRect = $Darkness/darkleft
@onready var darkcenter: ColorRect = $Darkness/darkcenter
@onready var darkright: ColorRect = $Darkness/darkright
@onready var x_ray: Node2D = $"../Pond/Trees/X-Ray"
@onready var x_ray_view: Sprite2D = $BalviewXRay

var darkness: Array
var light_blocker: bool
var light_counter: int

func _ready() -> void:
	darkness = [darkleft, darkcenter, darkright]
	for dark in darkness:
		dark.visible = true
		dark.z_index = 40
	x_ray_view.visible = false
	light_blocker = false


func lights_on():
	for dark in darkness:
		dark.z_index = -10
		await get_tree().create_timer(1).timeout


func lights_off():
	for dark in darkness:
		dark.z_index = 40
		

func _process(_delta: float) -> void:
	x_ray_view.visible = x_ray.on
