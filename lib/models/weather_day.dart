class WeatherDay {
  final String time;

  final double weatherCode;

  final double temperature2mMax;

  final double temperature2mMin;

  final DateTime sunrise;
  final DateTime sunset;

  final double daylightDuration;

  final double precipitationSum;

  final double uvIndexMax;

  WeatherDay({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
    required this.daylightDuration,
    required this.precipitationSum,
    required this.uvIndexMax,
  });
}
