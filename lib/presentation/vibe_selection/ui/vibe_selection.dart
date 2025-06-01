import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_view.dart';

class VibeSelection extends StatelessWidget {
  final VibeSelectionState state;

  const VibeSelection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final vibes = [
      {
        'name': 'Movement',
        'displayName': 'VIBE_SELECTION.VIBES.MOVEMENT'.tr(),
        'icon': '🏃',
      },
      {
        'name': 'Culture',
        'displayName': 'VIBE_SELECTION.VIBES.CULTURE'.tr(),
        'icon': '🎭',
      },
      {
        'name': 'Night Out',
        'displayName': 'VIBE_SELECTION.VIBES.NIGHT_OUT'.tr(),
        'icon': '🌙',
      },
      {
        'name': 'Outdoors',
        'displayName': 'VIBE_SELECTION.VIBES.OUTDOORS'.tr(),
        'icon': '🌿',
      },
      {
        'name': 'Chill',
        'displayName': 'VIBE_SELECTION.VIBES.CHILL'.tr(),
        'icon': '🍺',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              vibes.map((vibe) {
                final isSelected = state.selectedVibes.contains(vibe['name']);
                return GestureDetector(
                  onTap:
                      () => context.read<VibeSelectionCubit>().toggleVibe(
                        vibe['name']!,
                      ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? ColorName.colorPrimary : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color:
                            isSelected
                                ? ColorName.colorPrimary
                                : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          vibe['icon']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          vibe['displayName']!,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 15),
        CustomCheckbox(
          text: 'VIBE_SELECTION.REMEMBER_VIBE'.tr(),
          value: state.rememberVibe,
          onChanged:
              (value) =>
                  context.read<VibeSelectionCubit>().toggleRememberVibe(value!),
        ),
      ],
    );
  }
}
