# Translations From JSON

This is a Godot plugin for importing JSON files for translations.

## Usage

1. [Install the plugin into your project](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html)
1. Add JSON translations files into your project.
1. Add the file to translations using Project Settings > Localization > Add *(Select "All files (\*)" to see the JSON file)*

## JSON Format

The json file must be an object with locale and messages keys.

- "locale" field signify which locale the texts are in.
- "message" field must be an object that contains keys and corresponding text as string value.

### Example JSON

```json
{
    "locale": "en",
    "messages": {
        "HELLOWORLD": "Hello world!",
        "SECONDTEXT": "This is the second text."
    }
}
```
