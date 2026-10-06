extends Node3D 
@export var activar := "brazo"  
var tope = false 
var velocidad := 9

var activa := true
var subiendo := false

func _process(delta): 
	if Input.is_action_just_pressed(activar):
		activa = !activa

	if not activa:
		return

	var inc = deg_to_rad(velocidad * delta)		
	
	if not tope: 
		self.rotate_y(-inc * velocidad) 
	else: 
		self.rotate_y(inc * velocidad) 
		
	if self.rotation_degrees.y < -50: 
		tope = true 
	elif self.rotation_degrees.y > 0: 
		tope = false
