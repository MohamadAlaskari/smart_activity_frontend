class LocationState {
  final String city;
  final bool isLoading;
  final String? error;

  const LocationState({
    required this.city,
    required this.isLoading,
    this.error,
  });

  factory LocationState.initial() {
    return const LocationState(city: '', isLoading: false);
  }

  LocationState copyWith({String? city, bool? isLoading, String? error}) {
    return LocationState(
      city: city ?? this.city,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
