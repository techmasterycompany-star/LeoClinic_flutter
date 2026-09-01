import 'package:shared_preferences/shared_preferences.dart';
class Prefhelper {
  static const String tokenkey = "auth_token";
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
}
