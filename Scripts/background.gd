extends Node2D

@onready var darkleft: ColorRect = $Darkness/darkleft
@onready var darkcenter: ColorRect = $Darkness/darkcenter
@onready var darkright: ColorRect = $Darkness/darkright
@onready var x_ray: Node2D = $"../Pond/Trees/X-Ray"
@onready var x_ray_view: Sprite2D = $BalviewXRay
@onready var light_sound: AudioStreamPlayer = $LightSound

var darkness: Array
var lights_on: bool
var light_blocker: bool
var light_counter: int

func _ready() -> void:
	lights_on = false
	darkness = [darkleft, darkcenter, darkright]
	for dark in darkness:
		dark.visible = true
		dark.z_index = 40
	x_ray_view.visible = false
	light_blocker = false


func reset():
	lights_on = false
	darkleft.z_index = 40
	darkcenter.z_index = 40
	darkright.z_index = 40
	x_ray_view.visible = false
	await get_tree().create_timer(3.0).timeout
	light_blocker = false


func _process(delta: float) -> void:
	x_ray_view.visible = x_ray.on
	if lights_on and light_blocker == false:
		for dark in darkness:
			dark.z_index = -10
			if light_counter < 3 and not light_sound.playing:
				light_sound.play()
				light_counter += 1
			await get_tree().create_timer(4).timeout
		light_blocker = true
