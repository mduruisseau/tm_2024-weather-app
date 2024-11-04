import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_1/models/weather_air_hour_quality.dart';

part 'weather_hour.g.dart';

@JsonSerializable()
class WeatherHour extends Equatable {
  final String time;

  final double weatherCode;

  final double temperature2m;

  final double apparentTemperature;

  final double rain;

  final double windSpeed10m;

  final double windDirection10m;

  WeatherAirHourQuality? airQuality;

  DateTime get datetime => DateTime.parse(time);

  WeatherHour({
    required this.time,
    required this.weatherCode,
    required this.temperature2m,
    required this.apparentTemperature,
    required this.rain,
    required this.windSpeed10m,
    required this.windDirection10m,
    this.airQuality,
  });

  factory WeatherHour.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherHourToJson(this);

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        temperature2m,
        apparentTemperature,
        rain,
        windSpeed10m,
        windDirection10m,
        airQuality,
      ];
}
