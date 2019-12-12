class_name QodotBuildMaterials
extends QodotBuildStep

func get_name() -> String:
	return "material_dict"

func get_type() -> int:
	return self.Type.SINGLE

func get_build_params() -> Array:
	return [
		'texture_list',
		'base_texture_path',
		'material_extension',
		'texture_extension',
		'texture_wads',
		'default_material',
	]

func _run(context) -> Array:
	var texture_list = context['texture_list']
	var base_texture_path = context['base_texture_path']
	var material_extension = context['material_extension']
	var texture_extension = context['texture_extension']
	var texture_wads = context['texture_wads']
	var default_material = context['default_material']

	print("\nLoading textures...")
	var texture_load_profiler = QodotProfiler.new()
	var texture_loader = QodotTextureLoader.new()
	var material_dict = texture_loader.load_texture_materials(
		texture_list,
		base_texture_path,
		material_extension,
		texture_extension,
		texture_wads,
		default_material
	)
	var texture_load_duration = texture_load_profiler.finish()
	print("Done in " + String(texture_load_duration * 0.001) + " seconds.\n")

	print("Map textures:")
	print(texture_list, '\n')

	return ["data", material_dict]
