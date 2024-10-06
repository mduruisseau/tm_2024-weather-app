import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/views/widgets/weather_image.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  Future<WeatherData> fetchWeatherData() async {
    Dio dio = Dio();

    const lat = 50.6095001;
    const lng = 3.1337447;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: FutureBuilder<WeatherData>(
          future: fetchWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final weatherData = snapshot.data!;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WeatherImage(
                        weatherCode: weatherData.currentWeather.weatherCode),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          "Température : ${weatherData.currentWeather.temperature}°C"),
                      Text(
                          "Humidité : ${weatherData.currentWeather.relativeHumidity}%"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          "Vitesse du vent : ${weatherData.currentWeather.windSpeed} km/h"),
                      Text(
                          "Direction du vent : ${weatherData.currentWeather.windDirection}°"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Pluie : ${weatherData.currentWeather.rain} mm"),
                      Text(
                          "Nuage : ${weatherData.currentWeather.cloudCover} %"),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
