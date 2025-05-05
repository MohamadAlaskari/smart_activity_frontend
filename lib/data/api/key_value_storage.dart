import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_activity_frontend/common/constants.dart';
import 'package:smart_activity_frontend/data/api/base_key_value_storage.dart';


/// Hive implementation to store key values.
class KeyValueStorage<T> implements BaseKeyValueStorage<T> {
  Future<void> init() async {
    await Hive.openBox<T>(Constants.hiveStorageKey);
  }

  /// Writes the provide [key], [value] pair to the in-memory cache.
  @override
  Future<void> write({
    required String key,
    required T value,
  }) async {
    final box = Hive.box<T>(Constants.hiveStorageKey);
    return box.put(key, value);
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  @override
  T? read({required String key}) {
    final box = Hive.box<T>(Constants.hiveStorageKey);
    final value = box.get(key);
    if (value is T) return value;
    return null;
  }

  @override
  Stream<T> watchAndReturnFirst({
    required String key,
    required T defaultValue,
  }) async* {
    final box = Hive.box<T>(Constants.hiveStorageKey);
    final value = read(key: key);
    if (value == null) {
      await write(key: key, value: defaultValue);
      yield defaultValue;
    } else {
      yield value;
    }

    yield* box.watch(key: key).map((event) => event.value as T);
  }
}