extends Node2D


@onready var pipes: AnimatedSprite2D = $Pipes
@onready var sprinkler: AnimatedSprite2D = $Sprinkler
@onready var red_canister: Sprite2D = $RedCanister
@onready var green_canister: Sprite2D = $GreenCanister
@onready var activate_sprinkler: Sprite2D = $"Activate Sprinkler"
@onready var move_sprinkler_left: Sprite2D = $"Move Sprinkler Left"
@onready var move_sprinkler_right: Sprite2D = $"Move Sprinkler Right"
@onready var button_press: AudioStreamPlayer = $ButtonPress

var active = false
var pos = 1
var pipecolor

func _ready() -> void:
	pipecolor = pipes.pipecolor
	red_canister.modulate.r8 = 200
	red_canister.modulate.g8 = 200
	red_canister.modulate.b8 = 200
	green_canister.modulate.r8 = 200
	green_canister.modulate.g8 = 200
	green_canister.modulate.b8 = 200
	activate_sprinkler.modulate.r8 = 200
	activate_sprinkler.modulate.g8 = 200
	activate_sprinkler.modulate.b8 = 200
	move_sprinkler_left.modulate.r8 = 200
	move_sprinkler_left.modulate.g8 = 200
	move_sprinkler_left.modulate.b8 = 200
	move_sprinkler_right.modulate.r8 = 200
	move_sprinkler_right.modulate.g8 = 200
	move_sprinkler_right.modulate.b8 = 200

func _process(_delta: float) -> void:
	if pos != sprinkler.desiredpos:
		sprinkler.desiredpos = pos
	if active != sprinkler.active:
		sprinkler.active = active
		

func _on_green_button_pressed() -> void:
	if active == false:
		pipes.pipecolor = 0
		pipecolor = pipes.pipecolor


func _on_red_button_pressed() -> void:
	if active == false:
		pipes.pipecolor = 1
		pipecolor = pipes.pipecolor


func _on_activator_pressed() -> void:
	if active == false:
		active = true
		await get_tree().create_timer(3.0).timeout
		active = false
	else:
		active = false
	if not button_press.playing:
		button_press.play()


func _on_left_mover_pressed() -> void:
	if pos != 0:
		pos = 0
	if not button_press.playing:
		button_press.play()


func _on_right_mover_pressed() -> void:
	if pos != 1:
		pos = 1
	if not button_press.playing:
		button_press.play()


func _on_green_button_mouse_entered() -> void:
	green_canister.modulate.r8 = 255
	green_canister.modulate.g8 = 255
	green_canister.modulate.b8 = 255


func _on_green_button_mouse_exited() -> void:
	green_canister.modulate.r8 = 200
	green_canister.modulate.g8 = 200
	green_canister.modulate.b8 = 200


func _on_red_button_mouse_entered() -> void:
	red_canister.modulate.r8 = 255
	red_canister.modulate.g8 = 255
	red_canister.modulate.b8 = 255


func _on_red_button_mouse_exited() -> void:
	red_canister.modulate.r8 = 200
	red_canister.modulate.g8 = 200
	red_canister.modulate.b8 = 200


func _on_activator_mouse_entered() -> void:
	activate_sprinkler.modulate.r8 = 255
	activate_sprinkler.modulate.g8 = 255
	activate_sprinkler.modulate.b8 = 255


func _on_activator_mouse_exited() -> void:
	activate_sprinkler.modulate.r8 = 200
	activate_sprinkler.modulate.g8 = 200
	activate_sprinkler.modulate.b8 = 200


func _on_left_mover_mouse_entered() -> void:
	move_sprinkler_left.modulate.r8 = 255
	move_sprinkler_left.modulate.g8 = 255
	move_sprinkler_left.modulate.b8 = 255


func _on_left_mover_mouse_exited() -> void:
	move_sprinkler_left.modulate.r8 = 200
	move_sprinkler_left.modulate.g8 = 200
	move_sprinkler_left.modulate.b8 = 200


func _on_right_mover_mouse_entered() -> void:
	move_sprinkler_right.modulate.r8 = 255
	move_sprinkler_right.modulate.g8 = 255
	move_sprinkler_right.modulate.b8 = 255


func _on_right_mover_mouse_exited() -> void:
	move_sprinkler_right.modulate.r8 = 200
	move_sprinkler_right.modulate.g8 = 200
	move_sprinkler_right.modulate.b8 = 200
