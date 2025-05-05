extends Control

@onready var max_points_count: RichTextLabel = $Hbox/MaxPointsCount
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var exit_btn: Button = $VBoxContainer/ExitBtn

func _ready() -> void:
	if OS.has_feature("web"):
		exit_btn.queue_free()

func _physics_process(_delta: float) -> void:
	max_points_count.text = str(Global.max_points)


func mouse_enter() -> void:
	audio_stream_player.start(0)



func down() -> void:
	audio_stream_player.start(1)


func _on_exit_btn_pressed() -> void:
	get_tree().quit()


func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
