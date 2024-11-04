import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/models/weather_hour.dart';
import 'package:weather_app_1/views/widgets/weather_image.dart';

class WeatherHourInfo extends StatelessWidget {
  final WeatherHour weatherHour;

  const WeatherHourInfo({super.key, required this.weatherHour});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(children: [
          Text(
            DateFormat("HH:mm").format(weatherHour.datetime),
          ),
          WeatherImage(
            weatherCode: weatherHour.weatherCode,
            size: 40,
          ),
          Text(
            "${weatherHour.temperature2m}°C",
          ),
        ]),
      ),
    );
  }
}
