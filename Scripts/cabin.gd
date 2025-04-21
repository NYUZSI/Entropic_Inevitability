extends Node

@onready var cabin_sprites: AnimatedSprite2D = $TpCabin/CabinSprites
@onready var record_player: Node2D = $RecordPlayer

var anomalous: bool
var positions = ["tp1", "tp2", "tp3"]
var base_pos = "default"
# 0 = base position, 1 = movement to wrong position, 2 = in wrong position, 3 = movement to right position
var wander = 0
var tpspeed = 1000
var pos
var severity: float
var playing: bool


func _ready() -> void:
	wander = 0
	record_player._ready()
	cabin_sprites.play("default")
	anomalous = false
	severity = 0.0
	playing = true


func reset():
	wander = 0
	record_player.reset()
	cabin_sprites.play("default")
	anomalous = false
	severity = 0.0


func _process(delta: float) -> void:
	if playing:
		if wander == 1:
			severity = 1.0
			pos = round(randi_range(0, 2000) / 1000)
			cabin_sprites.modulate.a8 -= tpspeed * delta
			if cabin_sprites.modulate.a8 == 0:
				cabin_sprites.play(positions[pos])
				wander = 2
		if wander == 3:
			await get_tree().create_timer(1.0).timeout
			severity = 0.0
			await get_tree().create_timer(2.0).timeout
			cabin_sprites.modulate.a8 -= tpspeed * delta
			if cabin_sprites.modulate.a8 == 0:
				cabin_sprites.play(base_pos)
				wander = 0
		if wander == 0:
			severity = 0.0
			if cabin_sprites.modulate.a8 < 255:
				cabin_sprites.modulate.a8 += tpspeed * delta
			pos = 3 # to not match with any sound value from the record player
		if wander == 2:
			severity = 1.0
			if cabin_sprites.modulate.a8 < 255:
				cabin_sprites.modulate.a8 += tpspeed * delta
		if record_player.playing == true and record_player.sound == pos:
			wander = 3
		if anomalous:
			wander = 1
			anomalous = false


func stop_sounds():
	record_player.playable = false
	record_player.chirp.stop()
	record_player.wind.stop()
	record_player.rune_hum.stop()
