class WeatherModel {
  final String date;
  final double tempMax;
  final double tempMin;
  final String icon;

  WeatherModel({
    required this.date,
    required this.tempMax,
    required this.tempMin,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['datetime'],
      tempMax: (json['tempmax'] as num).toDouble(),
      tempMin: (json['tempmin'] as num).toDouble(),
      icon: json['icon'],
    );
  }
}
