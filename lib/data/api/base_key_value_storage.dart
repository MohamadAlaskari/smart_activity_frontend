abstract class BaseKeyValueStorage<T> {
  Future<void> write({required String key, required T value});
  T? read({required String key});
  Stream<T> watchAndReturnFirst({
    required String key,
    required T defaultValue,
  });
}