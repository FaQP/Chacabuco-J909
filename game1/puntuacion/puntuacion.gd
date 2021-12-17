extends Node2D


var cofre_punt = 0
var offset_punt = 70 #Distancia en x entre cofres
var lista_cofres = []
export (PackedScene) var spr_cofre

func _ready(): #Al estár listo llamará a la función crear_punt
	crear_punt()
	
func crear_punt():
	for i in cofre_punt: #Por cada cofre en la puntuación
		var newPunt = spr_cofre.instance() #La variable newPunt es igual a una instancia del sprite "cofre"
		get_tree().get_nodes_in_group("gui")[0].add_child(newPunt) #Se añadirán objetos en la clase "gui", los cuales serán hijos, la cantidad está determinada por newPunt
		newPunt.global_position.x -= offset_punt *i #Se resta la posición global del objeto una distancia determinada
		lista_cofres.append(newPunt) #A la lista de cofres se le adjuntan cofres en un numero determinado por newPunt


func agregar_puntaje(): #Lo mismo que la de arriba pero funciona.
	cofre_punt += 1 
	var newPunt = spr_cofre.instance() 
	get_tree().get_nodes_in_group("gui")[0].add_child(newPunt) 
	newPunt.global_position.x -= offset_punt * (cofre_punt -1)
	#lista_cofres[cofre_punt+1].append(newPunt) #Ni idea de porque está comentado, pero dejar así por las dudas.


