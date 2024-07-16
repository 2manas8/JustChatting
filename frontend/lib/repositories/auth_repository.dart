import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static String tokenKey = 'tokenKey';

  static Future<void> saveToken(String token) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenKey, token);
  }

  static Future<String?> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  static Future<bool> tokenAvailable() async {
    var prefs = await SharedPreferences.getInstance();
    return (prefs.getString(tokenKey) != null);
  }

  static Future<void> removeToken() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(tokenKey);
  }
}