extends Node2D


@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
var gravity: int = 0
@export var earth_pos: int
@export var venus_pos: int
@export var moon_pos: int


func _ready():
	position.y = earth_pos
	
		
func _process(delta: float) -> void:
	if gravity == 0:
		if position.y < earth_pos:
			position.y += 100 * delta
		if animation_player.is_playing():
			animation_player.stop()
	if gravity == 1:
		if position.y > venus_pos:
			position.y -= 50 * delta
		if position.y < venus_pos:
			position.y += 70 * delta
		if not animation_player.is_playing():
			animation_player.play("Shake")
	if gravity == 2:
		if position.y > moon_pos:
			position.y -= 50 * delta
		if position.y < moon_pos:
			position.y += 70 * delta
		if not animation_player.is_playing():
			animation_player.play("Shake")
