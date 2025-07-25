import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vibe_day/common/constants.dart';
import 'package:vibe_day/data/api/key_value_storage.dart';
import 'package:vibe_day/data/repository/auth_data_repository.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/app/app.dart';

Future<void> main() async {
  await mainCommon();
}

Future<void> mainCommon() async {
  WidgetsBinding _ = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  final hiveKeyStore = KeyValueStorage();
  await hiveKeyStore.init();

  if (kIsWeb) {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorage.webStorageDirectory,
    );
  } else {
    final directory = await getTemporaryDirectory();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: directory,
    );
  }

  final userStorageRepository = UserStorageRepository(
    storageKey: 'user_storage',
  );
  await userStorageRepository.init();

  final authDataRepository = AuthDataRepository();

  final vibeDayRepository = VibeDayRepository(
    tokenStorageRepository: authDataRepository,
    baseUrl: Constants.baseUrl,
    userStorageRepository: userStorageRepository,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      child: App(
        vibeDayRepository: vibeDayRepository,
        userStorageRepository: userStorageRepository,
      ),
    ),
  );
}