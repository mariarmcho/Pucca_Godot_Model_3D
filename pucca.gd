extends Node3D
@export var incremento := -0.75
@export var velocidad := 20.0 

func _process(nuevo_incremento):
	var direccion = Vector3.ZERO

	if Input.is_action_pressed("hacia_delante"):
		direccion.y -= 1

	if Input.is_action_pressed("hacia_atras"):
		direccion.y += 1

	if direccion != Vector3.ZERO:
		direccion = direccion.normalized()

	translate( direccion * velocidad * nuevo_incremento )
