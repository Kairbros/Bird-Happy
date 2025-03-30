extends Area2D
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		audio_stream_player.start(0)
		Global.point_count += 1
