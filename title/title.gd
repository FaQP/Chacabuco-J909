extends Node 

#Cuando el boton play se presiona suena el ruido del boton
func _on_but_play_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

#Cuando el boton exit se presiona suena el ruido del boton
func _on_but_ext_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

#Cuando el boton play se suelta se redirecciona al menú de juegos
func _on_but_play_released():
	#get_tree().change_scene("res://menu/menu.tscn")
	TRANSITION.change_scene_loc("res://menu/menu.tscn")

#Cuando el boton exit se suelta se cierra el juego
func _on_but_ext_released():
	TRANSITION.salir()
