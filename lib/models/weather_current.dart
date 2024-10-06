import 'package:json_annotation/json_annotation.dart';

part 'weather_current.g.dart';

@JsonSerializable()
class WeatherCurrent {
  @JsonKey(name: 'temperature_2m')
  final double temperature;

  @JsonKey(name: 'relative_humidity_2m')
  final double relativeHumidity;

  @JsonKey(name: 'apparent_temperature')
  final double apparentTemperature;

  @JsonKey(name: 'is_day')
  final int isDay;

  @JsonKey(name: 'precipitation')
  final double precipitation;

  @JsonKey(name: 'rain')
  final double rain;

  @JsonKey(name: 'showers')
  final double showers;

  @JsonKey(name: 'snowfall')
  final double snowfall;

  @JsonKey(name: 'cloud_cover')
  final double cloudCover;

  @JsonKey(name: 'pressure_msl')
  final double pressure;

  @JsonKey(name: 'surface_pressure')
  final double surfacePressure;

  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed;

  @JsonKey(name: 'wind_direction_10m')
  final double windDirection;

  @JsonKey(name: 'wind_gusts_10m')
  final double windGusts;

  @JsonKey(name: 'weather_code')
  final double weatherCode;

  WeatherCurrent({
    required this.temperature,
    required this.relativeHumidity,
    required this.apparentTemperature,
    required this.isDay,
    required this.precipitation,
    required this.rain,
    required this.showers,
    required this.snowfall,
    required this.cloudCover,
    required this.pressure,
    required this.surfacePressure,
    required this.windSpeed,
    required this.windDirection,
    required this.windGusts,
    required this.weatherCode,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCurrentToJson(this);
}
