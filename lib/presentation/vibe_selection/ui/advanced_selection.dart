import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/domain/model/life_vibe.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';

class LifeVibesQuestion extends StatelessWidget {
  final VibeSelectionState state;

  const LifeVibesQuestion({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final lifeVibes = LifeVibe.getAllLifeVibes();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.palette, size: 18, color: ColorName.colorPrimary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.TITLE'.tr(),
                style: TextStyle(fontSize: 16, color: ColorName.black),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.SUBTITLE'.tr(),
          style: TextStyle(fontSize: 12, color: Colors.grey[800]),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: lifeVibes.map((vibe) {
            final isSelected = state.selectedLifeVibes.contains(vibe.name);
            final canSelect = state.selectedLifeVibes.length < 3 || isSelected;

            return GestureDetector(
              onTap: canSelect
                  ? () => context
                  .read<VibeSelectionCubit>()
                  .toggleLifeVibe(vibe.name)
                  : null,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? ColorName.colorPrimary : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? ColorName.colorPrimary
                        : (canSelect
                        ? Colors.grey[300]!
                        : Colors.grey[200]!),
                    width: 1,
                  ),
                ),
                child: Text(
                  vibe.displayName,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : (canSelect ? Colors.black : Colors.grey[400]),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
