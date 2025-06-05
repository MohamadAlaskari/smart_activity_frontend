import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VibeType {
  final String name;
  final String displayName;
  final IconData icon;
  final Color color;

  const VibeType({
    required this.name,
    required this.displayName,
    required this.icon,
    required this.color,
  });

  static const VibeType movement = VibeType(
    name: 'Movement',
    displayName: 'VIBE_SELECTION.VIBES.MOVEMENT',
    icon: Icons.directions_run,
    color: Colors.orangeAccent,
  );

  static const VibeType culture = VibeType(
    name: 'Culture',
    displayName: 'VIBE_SELECTION.VIBES.CULTURE',
    icon: Icons.theater_comedy,
    color: Colors.deepPurpleAccent,
  );

  static const VibeType nightOut = VibeType(
    name: 'Night Out',
    displayName: 'VIBE_SELECTION.VIBES.NIGHT_OUT',
    icon: Icons.nightlife,
    color: Colors.purple,
  );

  static const VibeType outdoors = VibeType(
    name: 'Outdoors',
    displayName: 'VIBE_SELECTION.VIBES.OUTDOORS',
    icon: Icons.nature,
    color: Colors.green,
  );

  static const VibeType chill = VibeType(
    name: 'Chill',
    displayName: 'VIBE_SELECTION.VIBES.CHILL',
    icon: Icons.coffee,
    color: Colors.brown,
  );

  static List<VibeType> get all => [
    movement,
    culture,
    nightOut,
    outdoors,
    chill,
  ];

  String get localizedDisplayName => displayName.tr();
}
