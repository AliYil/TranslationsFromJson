# Translations From JSON for Godot 3.x

This is a Godot plugin for importing JSON files for translations.

## Usage

1. [Install the plugin into your project](https://docs.godotengine.org/en/3.5/tutorials/plugins/editor/installing_plugins.html)
2. Add JSON translations files into your project in .json format.
3. Add the file to translations using Project Settings > Localization > Add *(Select "All files (\*)" to see the JSON file)*

## JSON Format

The json data in file must be an object with locale and messages keys.

- "locale" field signify which locale the texts are in.
- "message" field must be an object that contains keys and corresponding text as string value.

### Example JSON

```json
{
    "locale": "en",
    "messages": {
        "HELLOWORLD": "Hello world!",
        "ANOTHERTEXT": "This is another text."
    }
}
```
