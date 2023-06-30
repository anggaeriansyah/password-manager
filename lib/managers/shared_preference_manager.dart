import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String _keyPassword = 'password';

  // Fungsi untuk menyimpan password ke SharedPreferences
  static Future<void> savePassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPassword, password);
  }

  // Fungsi untuk mengambil password dari SharedPreferences
  static Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPassword);
  }

  // Fungsi untuk memeriksa apakah password ada dalam SharedPreferences
  static Future<bool> hasPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyPassword);
  }

  // Fungsi untuk menghapus password dari SharedPreferences
  static Future<void> removePassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyPassword);
  }
}
