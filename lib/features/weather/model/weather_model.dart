class WeatherModel {
  final String condition;
  final double temperature;
  final String icon;

  WeatherModel({
    required this.condition,
    required this.temperature,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      condition: json['description'], // kommt aus deinem Backend
      temperature: json['temperature'].toDouble(),
      icon: json['icon'], // NEU: icon wird aus JSON gelesen
    );
  }
}
