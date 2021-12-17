extends CanvasLayer
#Variables
onready var anim : AnimationPlayer = $AnimationPlayer
#Funcion de cambio de escena
func change_scene_loc(path : String):
	layer = 1
	#fade in
	anim.play("fade")
	yield(anim, "animation_finished") #Primero el nodo del que voy a esperar una señal, y luego la señal que esperaré
	#Cambio de escena
	get_tree().change_scene(path)
	#fade out
	anim.play_backwards("fade")
	yield(anim, "animation_finished")
	layer = -1
#Funcion para cerrar el juego
func salir():
	layer = 1
	#fade in
	anim.play("fade")
	yield(anim, "animation_finished") #Primero el nodo del que voy a esperar una señal, y luego la señal que esperaré
	get_tree().quit()
