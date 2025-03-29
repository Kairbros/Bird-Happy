extends Control

@onready var max_points_count: RichTextLabel = $Hbox/MaxPointsCount

func _physics_process(delta: float) -> void:
	max_points_count.text = str(Global.max_points)
func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_exit_btn_pressed() -> void:
	get_tree().quit()
