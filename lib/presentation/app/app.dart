import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/app/app_cubit.dart';
import 'package:vibe_day/presentation/app/app_view.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';

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
        RepositoryProvider.value(value: userStorageRepository),
        BlocProvider(
          create: (_) => AppCubit(
            vibeDayRepository: vibeDayRepository,
            userStorageRepository: userStorageRepository,
          ),
        ),
        BlocProvider(
          create: (context) => VibeSelectionCubit(
            vibeDayRepository: context.read<VibeDayRepository>(),
            userStorageRepository: context.read<UserStorageRepository>(),
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}