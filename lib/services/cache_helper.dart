import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {

  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> cacheData({required String key, required bool value}) async{
    return await _sharedPreferences.setBool(key, value);
  }

  static bool? getCachedData({required String key}) {
    return _sharedPreferences.getBool(key);
  }

}