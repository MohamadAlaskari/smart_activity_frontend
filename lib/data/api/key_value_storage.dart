import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibe_day/common/constants.dart';
import 'package:vibe_day/data/api/base_key_value_storage.dart';

/// Plattformübergreifender Hive Key-Value Storage (Web, Mobile, Desktop)
class KeyValueStorage<T> implements BaseKeyValueStorage<T> {
  /// Initialisiert Hive und öffnet die Box – funktioniert auch im Web.
  Future<void> init() async {
    if (!Hive.isBoxOpen(Constants.hiveStorageKey)) {
      await Hive.initFlutter(); // funktioniert auf allen Plattformen
      await Hive.openBox<T>(Constants.hiveStorageKey);
    }
  }

  /// Speichert ein Schlüssel-Wert-Paar in der Hive-Box.
  @override
  Future<void> write({required String key, required T value}) async {
    final box = Hive.box<T>(Constants.hiveStorageKey);
    await box.put(key, value);
  }

  /// Liest einen gespeicherten Wert (falls vorhanden).
  @override
  T? read({required String key}) {
    final box = Hive.box<T>(Constants.hiveStorageKey);
    final value = box.get(key);
    if (value is T) return value;
    return null;
  }

  /// Streamt einen Wert und reagiert auf zukünftige Änderungen.
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
