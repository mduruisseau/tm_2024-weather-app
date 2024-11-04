import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_1/models/weather_hour.dart';

part 'weather_day.g.dart';

@JsonSerializable()
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

  final List<WeatherHour> hours;

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
    this.hours = const [],
  });

  DateTime get day => DateTime.parse(time);

  factory WeatherDay.fromJson(Map<String, dynamic> json) =>
      _$WeatherDayFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDayToJson(this);
}
