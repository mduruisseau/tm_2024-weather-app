import 'package:json_annotation/json_annotation.dart';

part 'weather_daily.g.dart';

@JsonSerializable()
class WeatherDaily {
  final List<String> time;

  @JsonKey(name: 'weather_code')
  final List<double> weatherCode;

  @JsonKey(name: 'temperature_2m_max')
  final List<double> temperature2mMax;

  @JsonKey(name: 'temperature_2m_min')
  final List<double> temperature2mMin;

  final List<DateTime> sunrise;
  final List<DateTime> sunset;

  @JsonKey(name: 'daylight_duration')
  final List<double> daylightDuration;

  @JsonKey(name: 'precipitation_sum')
  final List<double> precipitationSum;

  @JsonKey(name: 'uv_index_max')
  final List<double> uvIndexMax;

  WeatherDaily({
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

  factory WeatherDaily.fromJson(Map<String, dynamic> json) =>
      _$WeatherDailyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDailyToJson(this);
}
