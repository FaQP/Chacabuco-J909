extends Node
#Cuando se presionan los botones suenan los audios correspondientes
func _on_Back_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

func _on_game1_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()


func _on_game1_released():#Al soltar el boton se hará la transición correspondiente
	TRANSITION.change_scene_loc("res://game1/intro/introduction.tscn")


func _on_Back_released():#Al soltar el boton saldrá del juego
	TRANSITION.change_scene_loc("res://title/title.tscn")
