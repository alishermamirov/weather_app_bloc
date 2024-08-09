class WeatherExceptions implements Exception {
  final String message;

  WeatherExceptions({required this.message});
  @override
  String toString() {
    return message;
  }
}
