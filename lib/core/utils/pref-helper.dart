import 'package:shared_preferences/shared_preferences.dart';
class Prefhelper {
  static const String tokenkey = "auth_token";
  static const String userNameKey = "user_name";

  static Future<void> savetoken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(tokenkey, token);
  }

  static Future<String?> gettoken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(tokenkey);
  }

  static Future<void> deletetoken() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(tokenkey);
  }

  static Future<void> saveUserName(String name) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(userNameKey, name);
  }

  static Future<String?> getUserName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userNameKey);
  }

  static Future<void> deleteUserName() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(userNameKey);
  }
}
