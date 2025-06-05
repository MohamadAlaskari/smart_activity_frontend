import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExperienceType {
  final String name;
  final String displayName;
  final IconData icon;
  final Color color;

  const ExperienceType({
    required this.name,
    required this.displayName,
    required this.icon,
    required this.color,
  });

  static const ExperienceType adventurous = ExperienceType(
    name: 'Adventurous',
    displayName:
        'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.ADVENTUROUS',
    icon: Icons.explore,
    color: Colors.grey,
  );

  static const ExperienceType peaceful = ExperienceType(
    name: 'Peaceful',
    displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.PEACEFUL',
    icon: Icons.spa,
    color: Colors.orange,
  );

  static const ExperienceType social = ExperienceType(
    name: 'Social',
    displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.SOCIAL',
    icon: Icons.people,
    color: Colors.deepOrangeAccent,
  );

  static const ExperienceType playful = ExperienceType(
    name: 'Playful',
    displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.PLAYFUL',
    icon: Icons.celebration,
    color: Colors.orangeAccent,
  );

  static const ExperienceType romantic = ExperienceType(
    name: 'Romantic',
    displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.ROMANTIC',
    icon: Icons.favorite,
    color: Colors.pinkAccent,
  );

  static const ExperienceType productive = ExperienceType(
    name: 'Productive',
    displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.PRODUCTIVE',
    icon: Icons.emoji_events,
    color: Colors.orangeAccent,
  );

  static const ExperienceType inspiring = ExperienceType(
    name: 'Inspiring',
    displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.INSPIRING',
    icon: Icons.lightbulb,
    color: Colors.orangeAccent,
  );

  static const ExperienceType mood = ExperienceType(
    name: 'Mood',
    displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.EXPERIENCE_TYPES.MOOD',
    icon: Icons.auto_awesome,
    color: Colors.purpleAccent,
  );

  static List<ExperienceType> get all => [
    adventurous,
    peaceful,
    social,
    playful,
    romantic,
    productive,
    inspiring,
    mood,
  ];

  String get localizedDisplayName => displayName.tr();
}
