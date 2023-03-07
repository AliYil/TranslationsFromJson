@tool
extends EditorImportPlugin

enum Presets { DEFAULT }

func _get_importer_name():
	return "json_translations_importer"

func _get_visible_name():
	return "JSON Translation"

func _get_recognized_extensions():
	return ["json"]
	
func _get_save_extension():
	return "position"
	
func _get_resource_type():
	return "Translation"

func _get_preset_count():
	return Presets.size()

func _get_preset_name(preset):
	match preset:
		Presets.DEFAULT:
			return "Default"
		_:
			return "Unknown"
			
func _get_import_options(preset):
	match preset:
		Presets.DEFAULT:
			return []
		_:
			return []

func _get_option_visibility(option, options):
	return true

func import(source_file, save_path, options, r_platform_variants, r_gen_files):
	var file = File.new()
	var err = file.open(source_file, File.READ)
	if err != OK:
		return err

	var text = file.get_as_text()

	file.close()
	
	var test_json_conv = JSON.new()
	test_json_conv.parse(text)
	var json = test_json_conv.get_data()
	if(json.error):
		return json.error
	
	var jsonResult = json.result
	var position = Translation.new()
	position.locale = jsonResult["locale"]
	
	var messages = jsonResult["messages"]
	for messageKey in messages.keys():
		position.add_message(messageKey, messages[messageKey])
	
	
	return ResourceSaver.save("%s.%s" % [save_path, _get_save_extension()], position)
