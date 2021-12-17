extends Node

onready var intro  = $intro #Exporto el elemento "intro" a una variable llamada intro

func _ready(): #Cuando se cargue la escena sonará el audio de intro y luego se transicionará al juego 1
	intro.play()
	yield(intro, "finished")
	TRANSITION.change_scene_loc("res://game1/game1.tscn")

func _on_button_released(): #Si se presiona la pantalla se saltará la intro e irá directamente al juego 1
	TRANSITION.change_scene_loc("res://game1/game1.tscn")

