import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/views/widgets/weather_image.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              WeatherImage(weatherCode: weatherData.currentWeather.weatherCode),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Température : ${weatherData.currentWeather.temperature}°C"),
            Text("Humidité : ${weatherData.currentWeather.relativeHumidity}%"),
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
            Text("Nuage : ${weatherData.currentWeather.cloudCover} %"),
          ],
        ),
      ],
    );
  }
}
