import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/home/home_cubit.dart';
import 'package:vibe_day/presentation/home/home_state.dart';
import 'package:vibe_day/presentation/home/home_view.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final vibeDayRepository = context.read<VibeDayRepository>();
        final userStorageRepository = context.read<UserStorageRepository>();
        return HomeCubit(
          vibeDayRepository: vibeDayRepository,
          userStorageRepository: userStorageRepository,
        );
      },
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (prev, cur) => prev.screenStatus != cur.screenStatus,
        listener: _onStatusChanged,
        child: const HomeView(),
      ),
    );
  }

  void _onStatusChanged(BuildContext context, HomeState state) {}
}
