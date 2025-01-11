import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) => prefs.getString(key);
  Future<void> setString(String key, String value) => prefs.setString(key, value);
}
