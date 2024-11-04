import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_air_hourly_quality.dart';

class WeatherAirMeansInfo extends StatelessWidget {
  const WeatherAirMeansInfo({
    super.key,
    required this.weatherHour,
  });

  final WeatherAirHourlyQuality weatherHour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Air Quality means:',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Amonia : ${weatherHour.meanAmmonia}'),
          Text('Ozone : ${weatherHour.meanOzone}'),
          Text('Dust : ${weatherHour.meanDust}'),
          Text('Carbon Monoxide : ${weatherHour.meanCarbonMonoxide}'),
        ],
      ),
    );
  }
}
