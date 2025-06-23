class ApiConstants {
  static const String baseUrl =
      'https://smart-activity-backend.alaskaritech.com';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String currentUser = '/auth/current-user';

  // Weather endpoints
  static const String weatherWeekLocation = '/weather/week/location';

  // location endpoints
  static const String locationResolveCity = '/directions/resolve-city';
}
