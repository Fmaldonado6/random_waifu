import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class Preferences {
  SharedPreferences? _instance;

  String _autoSaveKey = "autoSaveKey";

  Future init() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future setAutoSave(bool enabled) async {
    await _instance?.setBool(_autoSaveKey, enabled);
  }

  bool getAutoSave()  {
    return _instance?.getBool(_autoSaveKey) ?? true;
  }
}
