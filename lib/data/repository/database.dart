import 'package:shared_preferences/shared_preferences.dart';

class Database {
  static late final SharedPreferences database;
  static Future<void> init() async => database = await SharedPreferences.getInstance();
}
