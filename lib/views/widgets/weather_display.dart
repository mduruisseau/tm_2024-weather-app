import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/views/widgets/weather_current_info.dart';
import 'package:weather_app_1/views/widgets/weather_day_info.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherCurrentInfo(currentWeather: weatherData.currentWeather),
        const Divider(height: 16),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              WeatherDay weatherDay = weatherData.getDayIndex(index);
              return WeatherDayInfo(weatherDay: weatherDay);
            },
            itemCount: weatherData.daily.time.length,
          ),
        ),
      ],
    );
  }
}
