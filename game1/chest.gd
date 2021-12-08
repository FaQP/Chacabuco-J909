extends Node

onready var button = $butt
onready var empty = $empty
onready var treasure = $treasure
onready var anim = $AnimationPlayer
onready var bien = $bien

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
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
