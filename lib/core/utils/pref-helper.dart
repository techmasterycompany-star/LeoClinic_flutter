import 'package:shared_preferences/shared_preferences.dart';

class Prefhelper {
  static const String _tokenKey = "auth_token";
  static const String _roleKey = "user_role";
  static const String _userNameKey = "user_name";

  static Future<void> savetoken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_tokenKey, token);
  }

  static Future<String?> gettoken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_tokenKey);
  }

  static Future<void> deletetoken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_tokenKey);
  }

  static Future<void> saveRole(String role) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_roleKey, role);
  }

  static Future<String?> getRole() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_roleKey);
  }

  static Future<void> saveUserName(String name) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_userNameKey, name);
  }

  static Future<String?> getUserName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_userNameKey);
  }

  static Future<void> clearAll() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_tokenKey);
    await pref.remove(_roleKey);
    await pref.remove(_userNameKey);
  }
}
