extends Node

@onready var cabin_sprites: AnimatedSprite2D = $TpCabin/CabinSprites
@onready var record_player: Node2D = $RecordPlayer

var positions = ["tp1", "tp2", "tp3"]
var base_pos = "default"
# 0 = base position, 1 = movement to wrong position, 2 = in wrong position, 3 = movement to right position
var wander = 0
var tpspeed = 1000
var pos


func _ready() -> void:
	wander = 0
	cabin_sprites.play("default")

func _process(delta: float) -> void:
	if wander == 1:
		pos = round(randi_range(0, 2000) / 1000)
		cabin_sprites.modulate.a8 -= tpspeed * delta
		if cabin_sprites.modulate.a8 == 0:
			cabin_sprites.play(positions[pos])
			wander = 2
	if wander == 3:
		cabin_sprites.modulate.a8 -= tpspeed * delta
		if cabin_sprites.modulate.a8 == 0:
			cabin_sprites.play(base_pos)
			wander = 0
	if wander == 0:
		if cabin_sprites.modulate.a8 < 255:
			cabin_sprites.modulate.a8 += tpspeed * delta
		pos = 3 # to not match with any sound value from the record player
	if wander == 2:
		if cabin_sprites.modulate.a8 < 255:
			cabin_sprites.modulate.a8 += tpspeed * delta
	if record_player.playing == true and record_player.sound == pos:
		wander = 3


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tester"):
		wander += 1
		if wander == 4:
			wander = 0
