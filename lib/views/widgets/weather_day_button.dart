import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/cubit/weather_day_cubit.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/views/widgets/weather_image.dart';

class WeatherDayButton extends StatelessWidget {
  const WeatherDayButton({
    super.key,
    required this.weatherDay,
    required this.time,
  });

  final WeatherDay weatherDay;
  final String time;

  @override
  Widget build(BuildContext context) {
    final selectedTextTheme = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        );

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        context.read<WeatherDayCubit>().selectWeatherDay(weatherDay);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            WeatherImage(
              weatherCode: weatherDay.weatherCode,
              size: 80,
            ),
            const SizedBox(height: 6),
            Text(
              DateFormat.MEd().format(weatherDay.day),
              style: time == weatherDay.time
                  ? selectedTextTheme
                  : Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
