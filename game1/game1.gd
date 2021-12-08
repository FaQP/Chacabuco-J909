extends Node

var random = RandomNumberGenerator.new()
var cofrecito
var correcto
onready var circle = $circle
onready var rectangle = $rectangle
onready var square = $square
onready var triangle = $triangle
onready var aire = $Node2D
var cuentaVidas = 3
onready var music = $bgm
onready var icircle = $icircle
onready var irectangle = $irectangle
onready var isquare = $isquare
onready var itriangle = $itriangle
var aux = 0
var cAux = 0
var rAux = 0
var sAux = 0
var tAux = 0
onready var puntos = $puntuacion
var auxPuntos = 0
onready var god = $gudED

func _process(delta):
	if(cuentaVidas==0):
		get_tree().reload_current_scene()
		TRANSITION.change_scene_loc("res://menu/menu.tscn")
	
	if(auxPuntos == 5):
		icircle.stop()
		irectangle.stop()
		isquare.stop()
		itriangle.stop()
		god.play()
		yield(god, "finished")
		TRANSITION.change_scene_loc("res://menu/menu.tscn")
	
	if(aux==0 && auxPuntos<5):
		cAux=0
		rAux=0
		sAux=0
		tAux=0
		random.randomize()
		correcto=(random.randi_range(1, 4))
		print(correcto)
		if(correcto==1):
			icircle.play()
		elif(correcto==2):
			irectangle.play()
		elif(correcto==3):
			isquare.play()
		elif(correcto==4):
			itriangle.play()
		aux = 1
# Called when the node enters the scene tree for the first time.

func _ready():
	music.play()	
	

func _on_butcircle_pressed():
	if(correcto==1):
		circle.animLleno()
		puntos.agregar_puntaje()
		icircle.stop()
		auxPuntos += 1
		aux = 0
		if(rAux!=0):
			rectangle.animVacioInversa()
		if(sAux!=0):
			square.animVacioInversa()
		if(tAux!=0):
			triangle.animVacioInversa()
		circle.animLlenoInversa()
		
	else:
		circle.animVacio()
		aire.quitar_vida()
		cuentaVidas -= 1
		cAux=1


func _on_butrectangle_pressed():
	if(correcto==2):
		rectangle.animLleno()
		puntos.agregar_puntaje()
		irectangle.stop()
		auxPuntos += 1
		aux = 0
		if(cAux!=0):
			circle.animVacioInversa()
		if(sAux!=0):
			square.animVacioInversa()
		if(tAux!=0):
			triangle.animVacioInversa()
		rectangle.animLlenoInversa()
	else:
		rectangle.animVacio()
		aire.quitar_vida()
		cuentaVidas -= 1
		rAux=1


func _on_butsquare_pressed():
	if(correcto==3):
		square.animLleno()
		puntos.agregar_puntaje()
		isquare.stop()
		auxPuntos += 1
		aux = 0
		if(cAux!=0):
			circle.animVacioInversa()
		if(rAux!=0):
			rectangle.animVacioInversa()
		if(tAux!=0):
			triangle.animVacioInversa()
		square.animLlenoInversa()
	else:
		square.animVacio()
		aire.quitar_vida()
		cuentaVidas -= 1
		sAux=1



func _on_buttriangle_pressed():
	if(correcto==4):
		triangle.animLleno()
		puntos.agregar_puntaje()
		itriangle.stop()
		auxPuntos += 1
		aux = 0
		if(cAux!=0):
			circle.animVacioInversa()
		if(rAux!=0):
			rectangle.animVacioInversa()
		if(sAux!=0):
			square.animVacioInversa()
		triangle.animLlenoInversa()
		
	else:
		triangle.animVacio()
		aire.quitar_vida()
		cuentaVidas -= 1
		sAux=1
