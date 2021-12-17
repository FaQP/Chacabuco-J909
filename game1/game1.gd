extends Node
#Variables
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
var auxRandom = 0
var cAux = 0
var rAux = 0
var sAux = 0
var tAux = 0
onready var puntos = $puntuacion
var cofres = 0
var randomNum
var puedeAbrirCofre = true
var cooldown = 2
var timer

#Funcion que se inicia al iniciar  la escena
func _ready():
	music.play() #El audio "music" se reproduce
	timer = Timer.new() #Se crea un nuevo Timer
	add_child(timer) #Añade el timer como hijo del nodo actual
	timer.set_one_shot(true) #La propiedad set_one_shot del timer se pone en true, para que no se repita de forma infinita
	timer.set_wait_time(cooldown) #El wait time esta condicionado por el tiempo de la variable cooldown
	timer.connect("timeout", self, "_cooldownEnd") #El timer se conectara a este nodo con la función _cooldownEnd cuando se termine el tiempo de ejecución

#Funcion que se repite constantemente en cada frame
func _process(delta):
	if(cuentaVidas<=0):#Si las vidas son 0 o menor, cambia de escena a la pantalla de perder
		TRANSITION.change_scene_loc("res://game1/replayLose.tscn")
	
	if(cofres == 7):#Si los cofres de puntuación llegan a 7, cambia de escena a la pantalla de ganar
		TRANSITION.change_scene_loc("res://game1/replayWin.tscn")

	if(auxRandom==0 && cofres<7): #Creación de numero random y reproducción de audio correspondiente
		cAux=0 #Variables para verificar que los cofres no se abrán mas de 1 vez
		rAux=0
		sAux=0
		tAux=0
		while(randomNum == correcto): #Verifica que no se repita el cofre correcto anterior
			random.randomize()
			correcto=(random.randi_range(1, 4))
		print(correcto) #Para ver en la consola el numero correcto y no necesitar escuchar los audios
		#Dependiendo de la variable "correcto" se ejecutara una opción u otra
		
		#Para cada situación en que "correcto" sea un numero distinto, se ejecuta su correspondiente case
		match(correcto):
			1:
				icircle.play()
			2:
				irectangle.play()
			3:
				isquare.play()
			4:
				itriangle.play()
		randomNum = correcto #Guarda el randomNum como el numero correcto anterior, para que luego no se repita el mismo cofre 2 veces seguidas.
		auxRandom = 1 #Cuando tengo el numero random, pongo el auxRandom en 0 para que no se genere otra variable random

func _on_butcircle_pressed(): #Cuando se presione el boton de circulo 
	if(correcto==1 and puedeAbrirCofre): #Si la variable random coincide, y el cd está disponible
		timer.start() #Se inicia el contador
		circle.animLleno() #Se ejecuta la animación del cofre del circulo lleno
		puntos.agregar_puntaje() #Se suma 1 a los cofres de puntuación
		icircle.stop() #Se detiene el audio del cofre correcto
		cofres += 1 #La puntuación se incrementa en 1
		auxRandom = 0 #Pongo la variable en 0, para que se genere otro cofre random
		if(rAux!=0): #Si los otros cofres quedaron abiertos, comenzara la animación inversa de los cofres vacios
			rectangle.animVacioInversa()
		if(sAux!=0):
			square.animVacioInversa()
		if(tAux!=0):
			triangle.animVacioInversa()
		circle.animLlenoInversa()
		puedeAbrirCofre = false #La variable para abrir los cofres queda en false
	elif(correcto!=1 and cAux ==0 and puedeAbrirCofre): #En el caso de que no sea correcto el cofre del circulo, que el cofre no se haya abierto, y que pueda abrirse otro cofre:
		circle.animVacio() #Se hace la animación de cofre de circulo vacío 
		aire.quitar_vida() #Se llama a la funcion quitar vida
		cuentaVidas -= 1  #Se resta 1 a la cantidad de vidas
		cAux=1 #Se marca que el cofre 1 fue abierto


func _on_butrectangle_pressed(): #Todo lo mismo que el de arriba pero cambiando circulo con rectangulo
	if(correcto==2 and puedeAbrirCofre):
		timer.start()
		rectangle.animLleno()
		puntos.agregar_puntaje()
		irectangle.stop()
		cofres += 1
		auxRandom = 0
		if(cAux!=0):
			circle.animVacioInversa()
		if(sAux!=0):
			square.animVacioInversa()
		if(tAux!=0):
			triangle.animVacioInversa()
		rectangle.animLlenoInversa()
		puedeAbrirCofre = false
	elif(correcto!=2 and rAux ==0 and puedeAbrirCofre):
		rectangle.animVacio()
		aire.quitar_vida()
		cuentaVidas -= 1
		rAux=1


func _on_butsquare_pressed(): #Lo mismo que en los anteriores pero con cuadrado
	if(correcto==3 and puedeAbrirCofre):
		timer.start()
		square.animLleno()
		puntos.agregar_puntaje()
		isquare.stop()
		cofres += 1
		auxRandom = 0
		if(cAux!=0):
			circle.animVacioInversa()
		if(rAux!=0):
			rectangle.animVacioInversa()
		if(tAux!=0):
			triangle.animVacioInversa()
		square.animLlenoInversa()
		puedeAbrirCofre = false
	elif(correcto!=3 and sAux ==0 and puedeAbrirCofre):
		square.animVacio()
		aire.quitar_vida()
		cuentaVidas -= 1
		sAux=1



func _on_buttriangle_pressed(): #Lo mismo que las otras funciones, pero con el triangulo
	if(correcto==4 and puedeAbrirCofre):
		timer.start()
		triangle.animLleno()
		puntos.agregar_puntaje()
		itriangle.stop()
		cofres += 1
		auxRandom = 0
		if(cAux!=0):
			circle.animVacioInversa()
		if(rAux!=0):
			rectangle.animVacioInversa()
		if(sAux!=0):
			square.animVacioInversa()
		triangle.animLlenoInversa()
		puedeAbrirCofre = false
	elif(correcto!=4 and sAux ==0 and puedeAbrirCofre):
		triangle.animVacio()
		aire.quitar_vida()
		cuentaVidas -= 1
		sAux=1


func _cooldownEnd(): #Cuando termina el tiempo seteado
	puedeAbrirCofre = true #La variable booleana se pone en true para poder abrir mas cofres

#Cuando se toca el boton de replay se reproducirá el sonido correspondiente
func _on_replaySound_released():
		match(correcto):
			1:
				icircle.play()
			2:
				irectangle.play()
			3:
				isquare.play()
			4:
				itriangle.play()
