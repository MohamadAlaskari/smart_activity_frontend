import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/domain/model/user.dart';
import 'package:vibe_day/presentation/app/app_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/ui/budget_setting.dart';
import 'package:vibe_day/presentation/vibe_selection/ui/distance_radius_setting.dart';
import 'package:vibe_day/presentation/vibe_selection/ui/group_size_selection.dart';
import 'package:vibe_day/presentation/vibe_selection/ui/time_window_selection.dart';
import 'package:vibe_day/presentation/vibe_selection/ui/vibe_selection.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';
import 'package:vibe_day/presentation/ui/buttons/vibe_day_button.dart';

class VibeSelectionView extends StatelessWidget {
  const VibeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'VIBE_SELECTION.TITLE'.tr(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, appState) {
          return BlocBuilder<VibeSelectionCubit, VibeSelectionState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(user: appState.user),
                    const SizedBox(height: 30),
                    VibeSelection(state: state),
                    const SizedBox(height: 30),
                    BudgetSetting(state: state),
                    const SizedBox(height: 30),
                    DistanceRadius(state: state),
                    const SizedBox(height: 30),
                    TimeWindow(state: state),
                    const SizedBox(height: 30),
                    GroupSize(state: state),
                    const SizedBox(height: 40),
                    FinishButton(state: state),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  final User? user;

  const Header({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final userName = user?.firstName ?? user?.username ?? '';
    final nameWithSpace = userName.isNotEmpty ? ' $userName' : '';

    final displayText = 'VIBE_SELECTION.HEADER'.tr(
      namedArgs: {'name': nameWithSpace},
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool?) onChanged;

  const CustomCheckbox({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: ColorName.colorPrimary,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}

class FinishButton extends StatelessWidget {
  final VibeSelectionState state;

  const FinishButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.screenStatus.when(
      pure: () => _buildButton(context),
      loading: () => _buildButton(context, isLoading: true),
      success: () => _buildButton(context),
      error: (error) => _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context, {bool isLoading = false}) {
    return VibeDayButton(
      text: 'VIBE_SELECTION.FINISH_BUTTON'.tr(),
      isLoading: isLoading,
      onPressed: () async {
        await context.read<VibeSelectionCubit>().finishSelection();
        if (context.mounted) {
          context.pop();
        }
      },
    );
  }
}
