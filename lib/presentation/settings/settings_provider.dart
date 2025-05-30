import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/settings/settings_cubit.dart';
import 'package:vibe_day/presentation/settings/settings_state.dart';
import 'package:vibe_day/presentation/settings/settings_view.dart';

class SettingsProvider extends StatelessWidget {
  const SettingsProvider({super.key});

  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final vibeDayRepository = context.read<VibeDayRepository>();
        return SettingsCubit(vibeDayRepository: vibeDayRepository);
      },
      child: BlocListener<SettingsCubit, SettingsState>(
        listenWhen: (prev, cur) => prev.screenStatus != cur.screenStatus,
        listener: _onStatusChanged,
        child: const SettingsView(),
      ),
    );
  }

  void _onStatusChanged(BuildContext context, SettingsState state) {}
}