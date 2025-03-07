import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;
  LocalStorageService._internal();

  static SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 保存数据
  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // 加载数据
  String? loadString(String key) {
    return _prefs?.getString(key);
  }

  // 清除数据
  Future<void> clear() async {
    await _prefs?.clear();
  }
}