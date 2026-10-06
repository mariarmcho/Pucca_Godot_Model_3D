extends Node3D

@onready var camara_1 = $CamaraOrbital
@onready var camara_2 = $CamaraPrimeraPersona

@onready var main_script = get_parent()

func _ready():
	camara_1.current = true
	camara_2.current = false
	
	if main_script.has_method("cambiar_camara_activa"):
		main_script.cambiar_camara_activa(camara_1)

func _process(_delta):
	if Input.is_action_just_pressed("camara_1"):
		camara_1.current = true
		camara_2.current = false
		if main_script.has_method("cambiar_camara_activa"):
			main_script.cambiar_camara_activa(camara_1)

	if Input.is_action_just_pressed("camara_2"):
		camara_1.current = false
		camara_2.current = true
		if main_script.has_method("cambiar_camara_activa"):
			main_script.cambiar_camara_activa(camara_2)
