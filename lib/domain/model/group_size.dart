import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GroupSizeType {
  final String name;
  final String displayName;
  final IconData icon;

  const GroupSizeType({
    required this.name,
    required this.displayName,
    required this.icon,
  });

  static const GroupSizeType solo = GroupSizeType(
    name: 'Solo',
    displayName: 'VIBE_SELECTION.GROUP_SIZE.SOLO',
    icon: Icons.person,
  );

  static const GroupSizeType duo = GroupSizeType(
    name: 'Duo',
    displayName: 'VIBE_SELECTION.GROUP_SIZE.DUO',
    icon: Icons.people,
  );

  static const GroupSizeType group = GroupSizeType(
    name: 'Group',
    displayName: 'VIBE_SELECTION.GROUP_SIZE.GROUP',
    icon: Icons.groups,
  );

  static List<GroupSizeType> get all => [solo, duo, group];

  String get localizedDisplayName => displayName.tr();
}
