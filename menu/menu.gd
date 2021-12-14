extends Node

func _ready():
	pass 

func _on_Back_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

func _on_game1_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()


func _on_game1_released():
	TRANSITION.change_scene_loc("res://game1/intro/introduction.tscn")


func _on_Back_released():
	TRANSITION.change_scene_loc("res://title/title.tscn")
