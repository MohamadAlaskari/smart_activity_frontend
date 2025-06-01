import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_view.dart';

class TimeWindow extends StatelessWidget {
  final VibeSelectionState state;

  const TimeWindow({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final timeWindows = [
      {
        'name': 'Morning',
        'displayName': 'VIBE_SELECTION.TIME_WINDOW.MORNING'.tr(),
      },
      {
        'name': 'Afternoon',
        'displayName': 'VIBE_SELECTION.TIME_WINDOW.AFTERNOON'.tr(),
      },
      {
        'name': 'Evening',
        'displayName': 'VIBE_SELECTION.TIME_WINDOW.EVENING'.tr(),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VIBE_SELECTION.TIME_WINDOW.TITLE'.tr(),
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 15),
        Row(
          children:
              timeWindows.map((window) {
                final isSelected = state.selectedTimeWindow == window['name'];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap:
                          () => context
                              .read<VibeSelectionCubit>()
                              .selectTimeWindow(window['name']!),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? ColorName.colorPrimary
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color:
                                isSelected
                                    ? ColorName.colorPrimary
                                    : Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            window['displayName']!,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 15),
        CustomCheckbox(
          text: 'VIBE_SELECTION.TIME_WINDOW.REMEMBER'.tr(),
          value: state.rememberTimeWindow,
          onChanged:
              (value) => context
                  .read<VibeSelectionCubit>()
                  .toggleRememberTimeWindow(value!),
        ),
      ],
    );
  }
}
