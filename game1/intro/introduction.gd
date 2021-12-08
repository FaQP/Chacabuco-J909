extends Node

onready var audio = $introduccion

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	audio.play()
	yield(audio, "finished")
	TRANSITION.change_scene_loc("res://game1/game1.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
