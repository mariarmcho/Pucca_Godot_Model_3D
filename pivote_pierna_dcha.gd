extends Node3D
@export var incremento := -0.75
var angulo := 0.0
var tope = false
var velocidad := 5

func _ready():
	_process(incremento)

func _process(nuevo_incremento):
	if Input.is_action_pressed("hacia_delante"):
		if not tope:
			self.rotate_x(nuevo_incremento * velocidad)
		else:
			self.rotate_x(-nuevo_incremento * velocidad)
			
		if self.rotation_degrees.x > 30:
			tope = true
		elif self.rotation_degrees.x < -30:
			tope = false

	if Input.is_action_pressed("hacia_atras"):
		if not tope:
			self.rotate_x(nuevo_incremento * velocidad)
		else:
			self.rotate_x(-nuevo_incremento * velocidad)
			
		if self.rotation_degrees.x > 30:
			tope = true
		elif self.rotation_degrees.x < -30:
			tope = false
