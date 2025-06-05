import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';

import 'package:vibe_day/domain/model/experience_type.dart';

class ExperienceTypesQuestion extends StatelessWidget {
  final VibeSelectionState state;

  const ExperienceTypesQuestion({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final experienceTypes = ExperienceType.all;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.theater_comedy,
              size: 18,
              color: ColorName.colorPrimary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.TITLE'.tr(),
                style: TextStyle(fontSize: 16, color: ColorName.black),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
          children:
              experienceTypes.map((experience) {
                final isSelected = state.selectedExperienceTypes.contains(
                  experience.name,
                );

                return GestureDetector(
                  onTap:
                      () => context
                          .read<VibeSelectionCubit>()
                          .toggleExperienceType(experience.name),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? ColorName.colorPrimary : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            isSelected
                                ? ColorName.colorPrimary
                                : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          experience.icon,
                          size: 16,
                          color: isSelected ? Colors.white : experience.color,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            experience.localizedDisplayName,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
