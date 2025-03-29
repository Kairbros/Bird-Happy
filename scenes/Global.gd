extends Node

var point_count : int = 0
var max_points : int = 0
var player_is_death : bool = false
var reset_timer : float = 1

var fullscreen : bool = false

func _physics_process(delta: float) -> void:

	if player_is_death:
		reset_timer -= delta
		if reset_timer <= 0:
			reset_timer = 0
			if Input.is_action_just_pressed("jump"):
				reset_game()
				get_tree().reload_current_scene()
			elif Input.is_action_just_pressed("exit"):
				reset_game()
				get_tree().change_scene_to_file("res://scenes/menu_scene.tscn")
func reset_game():
	player_is_death = false
	if max_points <= point_count:
		max_points = point_count
	point_count = 0
	reset_timer = 1
func _input(event):
	if event.is_action_pressed("fullscreen"):
		fullscreen = !fullscreen
		DisplayServer.window_set_mode(
			DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN if fullscreen else DisplayServer.WINDOW_MODE_WINDOWED
		)
