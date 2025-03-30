extends AudioStreamPlayer

@export var array_sound : Array[AudioStream]

func start(aux : int):
	stream = array_sound[aux]
	play()
