extends Node 

#Cuando el boton play se presiona suena el ruido del boton
func _on_but_play_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

<<<<<<< Updated upstream
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
#Siempre se ejecuta antes de un paso de física y se llama en intervalos de tiempo fijos: 60 veces por segundo por defecto. Puedes cambiar el intervalo desde la Configuración del Proyecto, en Physics -> Common -> Physics Fps.
func _physics_process(delta):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Para probar los eventos táctiles en un dispositivo sin pantalla táctil, abra Configuración del proyecto y vaya a la sección "Dispositivos de entrada/punto". Habilita "Emular el toque del ratón" y tu proyecto interpretará los clics y el movimiento del ratón como eventos táctiles.

#Cuando el boton play se suelta cambia a la siguiente escena
=======
#Cuando el boton exit se presiona suena el ruido del boton
func _on_but_ext_pressed():
	get_tree().get_nodes_in_group("sfx")[0].get_node("button").play()

#Cuando el boton play se suelta se redirecciona al menú de juegos
>>>>>>> Stashed changes
func _on_but_play_released():
	#get_tree().change_scene("res://menu/menu.tscn")
	TRANSITION.change_scene_loc("res://menu/menu.tscn")

#Cuando el boton exit se suelta se cierra el juego
func _on_but_ext_released():
	TRANSITION.salir()
