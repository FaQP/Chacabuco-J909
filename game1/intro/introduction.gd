extends Node

onready var audio = $introduccion

func _ready():
	audio.play()
	yield(audio, "finished")
	TRANSITION.change_scene_loc("res://game1/game1.tscn")



func _on_butSkip_released():
	TRANSITION.change_scene_loc("res://game1/game1.tscn")
