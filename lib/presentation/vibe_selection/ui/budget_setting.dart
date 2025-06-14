import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_view.dart';

class BudgetSetting extends StatelessWidget {
  final VibeSelectionState state;

  const BudgetSetting({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VIBE_SELECTION.BUDGET.TITLE'.tr(),
          style: TextStyle(fontSize: 16, color: ColorName.black),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Text('€0', style: TextStyle(fontSize: 14)),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: ColorName.colorPrimary,
                  inactiveTrackColor: Colors.grey[300],
                  thumbColor: ColorName.colorPrimary,
                  overlayColor: ColorName.colorPrimary,
                ),
                child: Slider(
                  value: state.budget,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  onChanged:
                      (value) => context
                          .read<VibeSelectionCubit>()
                          .updateBudget(value),
                ),
              ),
            ),
            const Text('∞', style: TextStyle(fontSize: 14)),
          ],
        ),
        Center(
          child: Text(
            '€${state.budget.toInt()}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
