extends StaticBody3D

var material_original = null
var mesh_instance : MeshInstance3D = null

func _ready():
	var padre = get_parent()
	if padre is MeshInstance3D:
		mesh_instance = padre
		material_original = mesh_instance.get_active_material(0)

func resaltar(activado: bool):
	if mesh_instance:
		if activado:
			var mat = StandardMaterial3D.new()
			mat.albedo_color = Color(randf(), randf(), randf())
			mesh_instance.set_material_override(mat)
		else:
			mesh_instance.set_material_override(null)
