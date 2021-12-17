extends Node

func _ready(): #Cuando esté listo sonara el audio de "lose"
	get_tree().get_nodes_in_group("sfx")[0].get_node("lose").play()

func _on_quit_pressed(): #Al presionar los botones sonarán sus audios
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

func _on_replay_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

#Al soltar los botones se harán las transiciones correspondientes
func _on_quit_released():
	TRANSITION.change_scene_loc("res://menu/menu.tscn")


func _on_replay_released():
	TRANSITION.change_scene_loc("res://game1/intro/introduction.tscn")
