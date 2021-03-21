import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/locale_preferences_keys_enum.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences.clear();
  }

  Future<void> setStringValue(LocalePreferencesKeys key, String value) async {
    await _preferences.setString(key.toString(), value);
  }

  Future<void> setBoolValue(LocalePreferencesKeys key, bool value) async {
    await _preferences.setBool(key.toString(), value);
  }

  String getStringValue(LocalePreferencesKeys key) => _preferences.getString(key.toString()) ?? '';

  bool getBoolValue(LocalePreferencesKeys key) => _preferences.getBool(key.toString()) ?? false;
}