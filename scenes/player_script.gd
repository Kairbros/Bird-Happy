class_name Player extends CharacterBody2D

var jump_force : float = -175
var gravity_force : float = 450

@onready var camera: Camera2D = $Camera
@onready var ui_animation: AnimationPlayer = $UIPlayer/UIAnimation
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var max_points_count: RichTextLabel = $UIPlayer/GameOverScreen/VBoxContainer/HBoxContainer/MaxPointsCount
@onready var points_count: RichTextLabel = $UIPlayer/GamePointCount/HBoxContainer/PointsCount



var player_death : bool = false

func _physics_process(delta: float) -> void:
	_games_point()

	sprite.rotation_degrees = clamp(sprite.rotation_degrees,-45,45)
	if velocity.y > 0:
		sprite.rotation_degrees = move_toward(sprite.rotation_degrees,45,100*delta)
	else:
		sprite.rotation_degrees = move_toward(sprite.rotation_degrees,-45,100*delta)
	velocity.y += delta * gravity_force
	if !player_death:
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_force
	move_and_slide()

func game_over():
	_max_points()
	sprite.play("death")
	set_physics_process(false)
	ui_animation.play("gameover")
	Global.player_is_death = true

func _games_point():
	points_count.text = str(Global.point_count)

func _max_points():
	if Global.max_points <= Global.point_count:
		max_points_count.text = str(Global.point_count)
	else:
		max_points_count.text = str(Global.max_points)
		
