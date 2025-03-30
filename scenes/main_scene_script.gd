extends Node2D

@onready var min_spawn_pipeline: Marker2D = $MinSpawnPipeline
@onready var max_spawn_pipeline: Marker2D = $MaxSpawnPipeline

const PIPELINE_01 = preload("res://scenes/pipeline_01.tscn")
@onready var background: Parallax2D = $Background

var array_pipeline : Array
var pipeline_base_time : float = 2
var pipeline_time : float = pipeline_base_time
var pipeline_timer :float = pipeline_time

var velocidad_base := 75
var velocidad := velocidad_base

var incremento_puntos := 5
var incremento_velocidad := 0.05

func _physics_process(delta: float) -> void:
	if !Global.player_is_death:
		velocidad = velocidad_base + (int(Global.point_count / incremento_puntos) * velocidad * incremento_velocidad)
		if array_pipeline.size() > 0:
			for i in array_pipeline.size():
				array_pipeline[i].global_position.x -= velocidad * delta
		if array_pipeline.size() >= 10:
			array_pipeline[0].queue_free()
			array_pipeline.remove_at(0)
		if pipeline_timer <= 0:
			var new_pipeline = PIPELINE_01.instantiate()
			add_child(new_pipeline)
			new_pipeline.position = Vector2(randi_range(min_spawn_pipeline.global_position.x,max_spawn_pipeline.global_position.x), randi_range(min_spawn_pipeline.global_position.y, max_spawn_pipeline.global_position.y))
			array_pipeline.append(new_pipeline)
			pipeline_timer = pipeline_base_time
		else:
			pipeline_base_time = pipeline_time - (int(Global.point_count / incremento_puntos) * pipeline_time * incremento_velocidad) 
			pipeline_timer -= delta
		background.autoscroll.x = -velocidad
	else:
		background.autoscroll.x = 0
