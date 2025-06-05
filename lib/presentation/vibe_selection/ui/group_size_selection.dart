import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/domain/model/group_size.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';

class GroupSize extends StatelessWidget {
  final VibeSelectionState state;

  const GroupSize({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final groupSizes = GroupSizeType.all;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VIBE_SELECTION.GROUP_SIZE.TITLE'.tr(),
          style: TextStyle(fontSize: 16, color: ColorName.black),
        ),
        const SizedBox(height: 15),
        Row(
          children:
              groupSizes.map((group) {
                final isSelected = state.selectedGroupSize == group.name;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap:
                          () => context
                              .read<VibeSelectionCubit>()
                              .selectGroupSize(group.name),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                isSelected
                                    ? ColorName.colorPrimary
                                    : Colors.grey[300]!,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              group.icon,
                              size: 32,
                              color:
                                  isSelected
                                      ? ColorName.colorPrimary
                                      : Colors.grey[600],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              group.localizedDisplayName,
                              style: TextStyle(
                                color:
                                    isSelected
                                        ? ColorName.colorPrimary
                                        : Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
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
