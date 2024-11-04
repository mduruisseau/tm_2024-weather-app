import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_air_hour_quality.dart';

class WeatherAirQualityHourInfo extends StatelessWidget {
  const WeatherAirQualityHourInfo({
    super.key,
    required this.weatherHour,
  });

  final WeatherAirHourQuality weatherHour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Amonia : ${weatherHour.ammonia}'),
              Text('Ozone : ${weatherHour.ozone}'),
              Text('Dust : ${weatherHour.dust}'),
              Text('Carbon Monoxide : ${weatherHour.carbonMonoxide}'),
              Text('Nitrogen Dioxide : ${weatherHour.nitrogenDioxide}'),
              Text('Sulphur Dioxide : ${weatherHour.sulphurDioxide}'),
              Text('PM10 : ${weatherHour.pm10}'),
              Text('PM2.5 : ${weatherHour.pm25}'),
              Text('UV Index : ${weatherHour.uvIndex}'),
              Text('UV Index Clear Sky : ${weatherHour.uvIndexClearSky}'),
              Text('European AQI : ${weatherHour.europeanAqi}'),
              Text('European AQI PM2.5 : ${weatherHour.europeanAqiPm25}'),
              Text('European AQI PM10 : ${weatherHour.europeanAqiPm10}'),
              Text('European AQI NO2 : ${weatherHour.europeanAqiNo2}'),
              Text('European AQI O3 : ${weatherHour.europeanAqiO3}'),
              Text('European AQI SO2 : ${weatherHour.europeanAqiSo2}'),
            ],
          ),
        ),
      ),
    );
  }
}
