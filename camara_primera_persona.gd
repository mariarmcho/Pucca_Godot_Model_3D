extends Camera3D
@onready var objetivo_cabeza = $"../../Pucca/cabeza" 
@export var incremento := 0.02 
@export var trasladar := 5.0
@export var incremento2 := 1
@export var umbral := 0.02 
var angulo := 0.0 
var angulo2 := 0.0 
var acciones := ["izquierda", "derecha","abajo", "arriba", "alejar", "acercar"]

func _ready():
	var delta = 0
	_process(delta)
	
func _process(_delta): 
	
	if !is_current(): 
		return
		
	rotation=Vector3(0,0,0.0)
	position=Vector3(0,0,0.0)
	for action in acciones:
		if Input.is_action_pressed(action):
			match action:
				"izquierda": angulo2 -= incremento
				"derecha": angulo2 += incremento
				"arriba": angulo -= incremento
				"abajo": angulo += incremento*0.5
				"alejar": trasladar *= 1.05
				"acercar":
					trasladar -= incremento2
					if trasladar < umbral : trasladar = umbral
	rotate_y(angulo2)
	rotate_x(angulo)
	translate(Vector3(0, 0, trasladar)) 
	
	if !is_current(): 
		return
		
	if objetivo_cabeza:
		global_position = objetivo_cabeza.global_position
		global_rotation = objetivo_cabeza.global_rotation
