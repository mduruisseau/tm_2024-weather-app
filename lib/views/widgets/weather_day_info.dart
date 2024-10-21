import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/views/widgets/weather_image.dart';

class WeatherDayInfo extends StatelessWidget {
  final WeatherDay weatherDay;

  const WeatherDayInfo({super.key, required this.weatherDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherDay.time,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WeatherImage(
                weatherCode: weatherDay.weatherCode,
                size: 80,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${weatherDay.temperature2mMin}° / ${weatherDay.temperature2mMax}°",
                ),
                Text(
                  "${weatherDay.precipitationSum}mm",
                ),
                Text(
                  "${DateFormat.Hms().format(weatherDay.sunrise)} -> ${DateFormat.Hms().format(weatherDay.sunset)}",
                ),
                Text(
                  "${weatherDay.uvIndexMax}",
                ),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
