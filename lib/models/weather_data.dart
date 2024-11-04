import 'package:weather_app_1/models/weather_current.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_1/models/weather_daily.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/models/weather_hourly.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final double latitude;
  final double longitude;

  @JsonKey(name: 'current')
  final WeatherCurrent currentWeather;

  final WeatherDaily daily;
  final WeatherHourly hourly;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.currentWeather,
    required this.daily,
    required this.hourly,
  });

  WeatherDay getDayIndex(int index) {
    return WeatherDay(
      time: daily.time[index],
      weatherCode: daily.weatherCode[index],
      temperature2mMax: daily.temperature2mMax[index],
      temperature2mMin: daily.temperature2mMin[index],
      daylightDuration: daily.daylightDuration[index],
      precipitationSum: daily.precipitationSum[index],
      sunrise: daily.sunrise[index],
      sunset: daily.sunset[index],
      uvIndexMax: daily.uvIndexMax[index],
      hours: hourly.getDay(day: daily.time[index]),
    );
  }

  WeatherDay getDay(String time) {
    return getDayIndex(daily.time.indexOf(time));
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
