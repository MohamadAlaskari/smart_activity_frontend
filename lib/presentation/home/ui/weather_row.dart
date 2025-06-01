import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/ui/helpers/weather_icon_helper.dart';

class WeatherRow extends StatelessWidget {
  final List<dynamic> weatherData;
  final Function(int dayIndex, Map<String, dynamic> weatherInfo)? onDayTap;
  final int selectedDayIndex;

  const WeatherRow({
    super.key,
    required this.weatherData,
    this.onDayTap,
    this.selectedDayIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (weatherData.isEmpty) {
      return Center(
        child: Text(
          'HOME.WEATHER.LOADING'.tr(),
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      );
    }

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherData.length.clamp(0, 4),
        itemBuilder: (context, index) {
          final weather = weatherData[index];
          final isToday = index == 0;
          final isTomorrow = index == 1;
          final isSelected = index == selectedDayIndex;

          String dayLabel;
          if (isToday) {
            dayLabel = 'HOME.WEATHER.TODAY'.tr();
          } else if (isTomorrow) {
            dayLabel = 'HOME.WEATHER.TOMORROW'.tr();
          } else {
            try {
              final date = DateTime.parse(weather['date']);
              dayLabel = DateFormat(
                'E',
                context.locale.languageCode,
              ).format(date);
            } catch (e) {
              dayLabel = 'HOME.WEATHER.DAY'.tr(args: ['${index + 1}']);
            }
          }

          return GestureDetector(
            onTap: () => onDayTap?.call(index, weather),
            child: Container(
              width: isSelected ? 90 : 80,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color:
                      isSelected
                          ? ColorName.colorPrimary
                          : Colors.grey.shade400,
                  width: isSelected ? 2 : 1,
                ),
                color: isSelected ? Colors.purple[50] : Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dayLabel,
                    style: TextStyle(
                      fontSize: isSelected ? 14 : 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  WeatherIconHelper.getWeatherIcon(
                    weather['icon'] ?? 'clear',
                    size: isSelected ? 20 : 18,
                  ),
                  const SizedBox(height: 4),
                  Flexible(
                    child: Text(
                      '${_getTemp(weather['tempmax'])}°/${_getTemp(weather['tempmin'])}°C',
                      style: TextStyle(
                        fontSize: isSelected ? 11 : 10,
                        color: Colors.grey[900],
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int _getTemp(dynamic temp) {
    if (temp == null) return 0;
    if (temp is int) return temp;
    if (temp is double) return temp.round();
    if (temp is String) return int.tryParse(temp) ?? 0;
    return 0;
  }
}
