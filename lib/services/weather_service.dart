import 'package:dio/dio.dart';
import 'package:weather_app_1/models/weather_data.dart';

class WeatherService {
  final Dio dio = Dio();

  final lat = 50.6095001;
  final lng = 3.1337447;

  Future<WeatherData> fetchWeatherData() async {
    await Future.delayed(const Duration(seconds: 2));

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
    });

    return WeatherData.fromJson(response.data);
  }
}
