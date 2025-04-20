extends Node2D


@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
var gravity: int = 0
var severity: float
@export var earth_pos: int
@export var venus_pos: int
@export var moon_pos: int


func _ready():
	position.y = earth_pos


func reset():
	position.y = earth_pos
	severity = 0.0
	
		
func _process(delta: float) -> void:
	if gravity == 0:
		severity = 0.0
		if position.y < earth_pos:
			position.y += 400 * delta
		if animation_player.is_playing():
			animation_player.stop()
	if gravity == 1:
		severity = 1.0
		if position.y > venus_pos:
			position.y -= 100 * delta
		if position.y < venus_pos:
			position.y += 300 * delta
		if not animation_player.is_playing():
			animation_player.play("Shake")
	if gravity == 2:
		severity = 1.0
		if position.y > moon_pos:
			position.y -= 100 * delta
		if position.y < moon_pos:
			position.y += 130 * delta
		if not animation_player.is_playing():
			animation_player.play("Shake")
