import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/presentation/app/app_cubit.dart';
import 'package:vibe_day/presentation/home/home_provider.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_view.dart';

class VibeSelectionProvider extends StatelessWidget {
  const VibeSelectionProvider({super.key});

  static const String routeName = 'vibe_selection';

  @override
  Widget build(BuildContext context) {
    return BlocListener<VibeSelectionCubit, VibeSelectionState>(
      listenWhen: (prev, cur) => prev.screenStatus != cur.screenStatus,
      listener: _onStatusChanged,
      child: const VibeSelectionView(),
    );
  }

  void _onStatusChanged(BuildContext context, VibeSelectionState state) {
    state.screenStatus.maybeWhen(
      success: () {
        if (state.isFirstLogin) {
          context.read<AppCubit>().refreshUserState();
          context.goNamed(HomeProvider.routeName);
        }
      },
      orElse: () {},
    );
  }
}
