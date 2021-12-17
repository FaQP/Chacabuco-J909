extends Node

func _ready():
	get_tree().get_nodes_in_group("sfx")[0].get_node("god").play()

func _on_quit_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

func _on_replay_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()


func _on_quit_released():
	TRANSITION.change_scene_loc("res://menu/menu.tscn")


func _on_replay_released():
	TRANSITION.change_scene_loc("res://game1/intro/introduction.tscn")
