import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_1/models/weather_data.dart';

class WeatherService {
  final Dio dio = GetIt.instance<Dio>();

  Future<WeatherData> fetchWeatherData({
    required double lat,
    required double lng,
  }) async {
    var response = await dio
        .get('https://api.open-meteo.com/v1/forecast', queryParameters: {
      'latitude': lat,
      'longitude': lng,
      'timezone': 'Europe/Berlin',
      'current': [
        'temperature_2m',
        'relative_humidity_2m',
        'apparent_temperature',
        'is_day',
        'precipitation',
        'rain',
        'showers',
        'snowfall',
        'weather_code',
        'cloud_cover',
        'pressure_msl',
        'surface_pressure',
        'wind_speed_10m',
        'wind_direction_10m',
        'wind_gusts_10m'
      ].join(','),
      'daily': [
        'weather_code',
        'temperature_2m_max',
        'temperature_2m_min',
        'sunrise',
        'sunset',
        'daylight_duration',
        'uv_index_max',
        'precipitation_sum'
      ].join(','),
      'hourly': [
        'temperature_2m',
        'apparent_temperature',
        'rain',
        'weathercode',
        'windspeed_10m',
        'winddirection_10m'
      ].join(','),
    });

    return WeatherData.fromJson(response.data);
  }
}
