abstract class LocalStorageService {
  Future<void> setLocalStorage<T>(String key, T value);
  Future<T?> getLocalStorage<T>(String key);
  Future<bool> existLocalStorage(String key);
  Future<bool> removeLocalStorage(String key);
}
