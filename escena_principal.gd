extends Node3D

var camara_actual : Camera3D
var objeto_seleccionado = null

func cambiar_camara_activa(nueva_camara):
	camara_actual = nueva_camara

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		disparar_rayo(event.position)

func disparar_rayo(posicion_mouse):
	if camara_actual == null:
		return

	var origen = camara_actual.project_ray_origin(posicion_mouse)
	var direccion = camara_actual.project_ray_normal(posicion_mouse)
	var distancia = 1000.0
	var destino = origen + direccion * distancia

	var espacio = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(origen, destino)
	
	var resultado = espacio.intersect_ray(query)

	if resultado.has("collider"):
		var objeto_golpeado = resultado["collider"]
		
		if objeto_golpeado.has_method("resaltar"):
			
			if objeto_seleccionado != null:
				objeto_seleccionado.resaltar(false)
			
			objeto_seleccionado = objeto_golpeado
			objeto_seleccionado.resaltar(true)
	else:
		if objeto_seleccionado != null:
			objeto_seleccionado.resaltar(false)
			objeto_seleccionado = null
