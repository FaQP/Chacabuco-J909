extends Node

<<<<<<< Updated upstream

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

=======
#Cuando se presionan los botones correspondientes suena el audio de "button"
func _on_Back_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play() 
>>>>>>> Stashed changes

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

<<<<<<< Updated upstream



func _on_Back_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()
=======
#Cuando se sueltan los botones correspondientes se inician las transiciones
func _on_game1_released():
	TRANSITION.change_scene_loc("res://game1/intro/introduction.tscn")

func _on_Back_released():
>>>>>>> Stashed changes
	TRANSITION.change_scene_loc("res://title/title.tscn")


func _on_Cards_released():
	TRANSITION.change_scene_loc("res://game1/intro/introduction.tscn")

#Cuando el boton Cards se presione suena el ruido del boton (Hay que cambiar icono y nombre)
func _on_Cards_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()
