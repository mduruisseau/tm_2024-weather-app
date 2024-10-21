import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/cubit/config_cubit.dart';
import 'package:weather_app_1/cubit/weather_day_cubit.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/views/widgets/weather_current_info.dart';
import 'package:weather_app_1/views/widgets/weather_day_button.dart';
import 'package:weather_app_1/views/widgets/weather_day_info.dart';
import 'package:weather_app_1/views/widgets/weather_image.dart';

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
        BlocConsumer<WeatherDayCubit, WeatherDayState>(
          listener: (context, state) {
            if (state is WeatherDaySelected) {
              context
                  .read<ConfigCubit>()
                  .setDarkMode(state.weatherDay.weatherCode >= 3);
            }
          },
          builder: (context, state) {
            if (state is WeatherDaySelected) {
              return WeatherDayInfo(
                weatherDay: state.weatherDay,
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
