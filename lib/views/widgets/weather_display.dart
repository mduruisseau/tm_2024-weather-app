import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_1/cubit/weather_day_cubit.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/views/widgets/weather_current_info.dart';
import 'package:weather_app_1/views/widgets/weather_day_button.dart';
import 'package:weather_app_1/views/widgets/weather_day_info.dart';
import 'package:go_router/go_router.dart';

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
        SizedBox(
          height: 122,
          child: BlocBuilder<WeatherDayCubit, WeatherDayState>(
            builder: (context, state) {
              String time = "";

              if (state is WeatherDaySelected) {
                time = state.weatherDay.time;
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  WeatherDay weatherDay = weatherData.getDayIndex(index);

                  return WeatherDayButton(weatherDay: weatherDay, time: time);
                },
                itemCount: weatherData.daily.time.length,
              );
            },
          ),
        ),
        const Divider(),
        ElevatedButton(
          onPressed: () {
            context.read<WeatherDayCubit>().reset();
          },
          child: const Text("Reset"),
        ),
        const Divider(),
        BlocBuilder<WeatherDayCubit, WeatherDayState>(
          builder: (context, state) {
            if (state is WeatherDaySelected) {
              return Column(
                children: [
                  WeatherDayInfo(
                    weatherDay: state.weatherDay,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.go(
                        '/details/',
                        extra: jsonEncode(state.weatherDay.toJson()),
                      );
                    },
                    child: const Text("Voir +"),
                  )
                ],
              );
            }

            return Text(
              "Select a day",
              style: Theme.of(context).textTheme.headlineSmall,
            );
          },
        ),
      ],
    );
  }
}
