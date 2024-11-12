import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_1/models/weather_air_quality.dart';

@singleton
class AirQualityService {
  final Dio dio;

  AirQualityService({required this.dio});

  Future<WeatherAirQuality> fetchQualityData({
    required String day,
  }) async {
    var response = await dio.get(
      "https://air-quality-api.open-meteo.com/v1/air-quality",
      queryParameters: {
        'latitude': 50.6095001,
        'longitude': 3.1337447,
        'hourly': [
          'pm10',
          'pm2_5',
          'carbon_monoxide',
          'nitrogen_dioxide',
          'sulphur_dioxide',
          'ozone',
          'aerosol_optical_depth',
          'dust',
          'uv_index',
          'uv_index_clear_sky',
          'ammonia',
          'alder_pollen',
          'birch_pollen',
          'grass_pollen',
          'mugwort_pollen',
          'olive_pollen',
          'ragweed_pollen',
          'european_aqi',
          'european_aqi_pm2_5',
          'european_aqi_pm10',
          'european_aqi_no2',
          'european_aqi_o3',
          'european_aqi_so2'
        ],
        'timezone': 'Europe/Paris',
        'start_date': day,
        'end_date': day,
      },
    );

    return WeatherAirQuality.fromJson(response.data);
  }
}
