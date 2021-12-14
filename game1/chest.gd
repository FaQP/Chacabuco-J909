extends Node

onready var button = $butt
onready var empty = $empty
onready var treasure = $treasure
onready var anim = $AnimationPlayer
onready var bien = $bien

func _ready():
	pass 
	
func cofreLleno():
	empty.hide()

func cofreVacio():
	treasure.hide()

func animVacio():
	treasure.hide()
	anim.play("chestanimated")

func animLleno():
	empty.hide()
	bien.play()
	anim.play("tresurechest")
	yield(anim, "animation_finished")

func animVacioInversa():
	anim.play_backwards("chestanimated")
	yield(anim, "animation_finished")
	treasure.show()

func animLlenoInversa():
	anim.play_backwards("tresurechest")
	yield(anim, "animation_finished")
	empty.show()
