import 'package:easy_localization/easy_localization.dart';

class LifeVibe {
  final String name;
  final String displayName;

  const LifeVibe({required this.name, required this.displayName});

  static List<LifeVibe> getAllLifeVibes() {
    return [
      LifeVibe(
        name: 'Creative',
        displayName:
            'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.CREATIVE'.tr(),
      ),
      LifeVibe(
        name: 'Chill',
        displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.CHILL'.tr(),
      ),
      LifeVibe(
        name: 'Active',
        displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.ACTIVE'.tr(),
      ),
      LifeVibe(
        name: 'Curious',
        displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.CURIOUS'.tr(),
      ),
      LifeVibe(
        name: 'Social',
        displayName: 'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.SOCIAL'.tr(),
      ),
      LifeVibe(
        name: 'Structured',
        displayName:
            'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.STRUCTURED'.tr(),
      ),
      LifeVibe(
        name: 'Reflective',
        displayName:
            'VIBE_SELECTION.ADVANCED_SETTINGS.LIFE_VIBES.REFLECTIVE'.tr(),
      ),
    ];
  }
}
