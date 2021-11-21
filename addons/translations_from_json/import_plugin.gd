tool
extends EditorImportPlugin

enum Presets { DEFAULT }

func get_importer_name():
	return "json_translations_importer"

func get_visible_name():
	return "JSON Translation"

func get_recognized_extensions():
	return ["json"]
	
func get_save_extension():
	return "translation"
	
func get_resource_type():
	return "Translation"

func get_preset_count():
	return Presets.size()

func get_preset_name(preset):
	match preset:
		Presets.DEFAULT:
			return "Default"
		_:
			return "Unknown"
			
func get_import_options(preset):
	match preset:
		Presets.DEFAULT:
			return []
		_:
			return []

func get_option_visibility(option, options):
	return true

func import(source_file, save_path, options, r_platform_variants, r_gen_files):
	var file = File.new()
	var err = file.open(source_file, File.READ)
	if err != OK:
		return err

	var text = file.get_as_text()

	file.close()
	
	var json = JSON.parse(text)
	if(json.error):
		return json.error
	
	var jsonResult = json.result
	var translation = Translation.new()
	translation.locale = jsonResult["locale"]
	
	var messages = jsonResult["messages"]
	for messageKey in messages.keys():
		translation.add_message(messageKey, messages[messageKey])
	
	
	return ResourceSaver.save("%s.%s" % [save_path, get_save_extension()], translation)
