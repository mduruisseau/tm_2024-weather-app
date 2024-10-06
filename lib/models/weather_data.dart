import 'package:weather_app_1/models/weather_current.dart';

import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final double latitude;
  final double longitude;

  @JsonKey(name: 'current_weather')
  final WeatherCurrent currentWeather;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.currentWeather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
