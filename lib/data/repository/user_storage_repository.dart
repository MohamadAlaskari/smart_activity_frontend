import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_activity_frontend/domain/model/user.dart';

const mspUser = 'mspUser';
const mastodonUser = 'mastodonUser';

class UserStorageRepository {
  UserStorageRepository({
    required String storageKey,
  }) : _storageKey = storageKey;

  final String _storageKey;

  Future<void> init() async {
    await Hive.openBox<String>(_storageKey);
  }

  Future<User?> getUser() async {
    final box = Hive.box<String>(_storageKey);
    final user = box.get(mspUser);
    if (user != null) {
      return User.fromJson(jsonDecode(user));
    }
    return null;
  }

  Future<void> saveUser(User user) async {
    final box = Hive.box<String>(_storageKey);
    await box.put(mspUser, jsonEncode(user.toJson()));
  }

  Future<void> deleteUser() async {
    final box = Hive.box<String>(_storageKey);
    await box.delete(mspUser);
  }

  Stream<User?> watchUser() async* {
    final box = Hive.box<String>(_storageKey);

    final value = box.get(mspUser);
    if (value == null) {
      yield null;
    } else {
      final user = User.fromJson(jsonDecode(value));
      yield user;
    }

    yield* box.watch(key: mspUser).map(
          (event) {
        if (event.deleted) return null;
        return User.fromJson(jsonDecode(event.value));
      },
    );
  }
}