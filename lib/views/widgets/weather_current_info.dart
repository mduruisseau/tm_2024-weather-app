import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_current.dart';
import 'package:weather_app_1/views/widgets/weather_image.dart';

class WeatherCurrentInfo extends StatelessWidget {
  const WeatherCurrentInfo({
    super.key,
    required this.currentWeather,
  });

  final WeatherCurrent currentWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WeatherImage(weatherCode: currentWeather.weatherCode),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Température : ${currentWeather.temperature}°C"),
            Text("Humidité : ${currentWeather.relativeHumidity}%"),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Vitesse du vent : ${currentWeather.windSpeed} km/h"),
            Text("Direction du vent : ${currentWeather.windDirection}°"),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Pluie : ${currentWeather.precipitation} mm"),
            Text("Nuage : ${currentWeather.cloudCover} %"),
          ],
        ),
      ],
    );
  }
}
