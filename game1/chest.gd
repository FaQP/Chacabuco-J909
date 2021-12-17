extends Node

onready var empty = $empty
onready var treasure = $treasure
onready var anim = $AnimationPlayer

func cofreLleno(): #Esta función esconde el cofre vacio en la posición del objeto
	empty.hide()

func cofreVacio(): #Esta función esconde el cofre lleno en la posición del objeto
	treasure.hide()

func animVacio(): #Suena el audio de "mal" y empieza la animación del cofre vacio
	get_tree().get_nodes_in_group("sfx")[0].get_node("mal").play()
	treasure.hide()
	anim.play("chestanimated")

func animLleno(): #Suena el audio de "bien" y empieza la animación del cofre vacio
	empty.hide()
	get_tree().get_nodes_in_group("sfx")[0].get_node("bien").play()
	anim.play("tresurechest")

func animVacioInversa(): #Se hace la animacion de vacio inversa
	anim.play_backwards("chestanimated") #play_backwards reproduce la animación desde el final
	yield(anim, "animation_finished")
	treasure.show() #Muestro el cofre escondido anteriormente

func animLlenoInversa(): #Se hace la animacion de lleno inversa
	anim.play_backwards("tresurechest")
	yield(anim, "animation_finished")
	empty.show() #Muestro el cofre escondido anteriormente
