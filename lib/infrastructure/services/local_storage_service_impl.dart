import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_vida_saludable/infrastructure/services/services.dart';

class LocalStorageServiceImpl extends LocalStorageService {
  @override
  Future<void> setLocalStorage<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();

    switch (T) {
      case int:
        prefs.setInt(key, value as int);
        break;
      case String:
        prefs.setString(key, value as String);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
      default:
        throw UnimplementedError(
            'SET not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<T?> getLocalStorage<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    switch (T) {
      case int:
        return prefs.getInt(key) as T?;
      case String:
        return prefs.getString(key) as T?;
      case bool:
        return prefs.getBool(key) as T?;
      default:
        throw UnimplementedError(
            'GET not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> existLocalStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  @override
  Future<bool> removeLocalStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
