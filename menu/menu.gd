extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Back_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()
	TRANSITION.change_scene_loc("res://title/title.tscn")


func _on_Cards_released():
	TRANSITION.change_scene_loc("res://game1/intro/introduction.tscn")

#Cuando el boton Cards se presione suena el ruido del boton (Hay que cambiar icono y nombre)
func _on_Cards_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()
