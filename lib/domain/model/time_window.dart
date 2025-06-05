import 'package:easy_localization/easy_localization.dart';

class TimeWindowType {
  final String name;
  final String displayName;

  const TimeWindowType({required this.name, required this.displayName});

  static const TimeWindowType morning = TimeWindowType(
    name: 'Morning',
    displayName: 'VIBE_SELECTION.TIME_WINDOW.MORNING',
  );

  static const TimeWindowType afternoon = TimeWindowType(
    name: 'Afternoon',
    displayName: 'VIBE_SELECTION.TIME_WINDOW.AFTERNOON',
  );

  static const TimeWindowType evening = TimeWindowType(
    name: 'Evening',
    displayName: 'VIBE_SELECTION.TIME_WINDOW.EVENING',
  );

  static List<TimeWindowType> get all => [morning, afternoon, evening];

  String get localizedDisplayName => displayName.tr();
}
