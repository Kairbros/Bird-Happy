extends Control

@onready var max_points_count: RichTextLabel = $Hbox/MaxPointsCount
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _physics_process(_delta: float) -> void:

	max_points_count.text = str(Global.max_points)


func mouse_enter() -> void:
	audio_stream_player.start(0)

func _on_start_btn_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")

func _on_exit_btn_button_up() -> void:
	get_tree().quit()

func down() -> void:
	audio_stream_player.start(1)
