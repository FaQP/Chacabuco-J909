extends Node2D


var cofre_punt = 0
var offset_punt = 70 #Distancia en x entre cofres
var lista_cofres = []
export (PackedScene) var spr_cofre

func _ready():
	crear_punt()
	
func crear_punt():
	for i in cofre_punt:
		var newPunt = spr_cofre.instance()
		get_tree().get_nodes_in_group("gui")[0].add_child(newPunt)
		newPunt.global_position.x -= offset_punt *i
		lista_cofres.append(newPunt)


func agregar_puntaje():
	cofre_punt += 1
	var newPunt = spr_cofre.instance()
	get_tree().get_nodes_in_group("gui")[0].add_child(newPunt)
	newPunt.global_position.x -= offset_punt * (cofre_punt -1)
	#lista_cofres[cofre_punt+1].append(newPunt)


