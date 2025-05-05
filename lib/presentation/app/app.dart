import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_activity_frontend/data/repository/user_storage_repository.dart';
import 'package:smart_activity_frontend/data/repository/vibe_day_repository.dart';
import 'package:smart_activity_frontend/presentation/app/app_cubit.dart';
import 'package:smart_activity_frontend/presentation/app/app_view.dart';

class App extends StatelessWidget {
  final VibeDayRepository vibeDayRepository;
  final UserStorageRepository userStorageRepository;

  const App({
    required this.vibeDayRepository,
    required this.userStorageRepository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider.value(value: vibeDayRepository),
        BlocProvider(
          create: (_) => AppCubit(
            vibeDayRepository: vibeDayRepository,
            userStorageRepository: userStorageRepository,
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}