import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_1/cubit/config_cubit.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/views/widgets/weather_day_info.dart';

class WeatherDayDetail extends StatelessWidget {
  final WeatherDay weatherDay;

  const WeatherDayDetail({super.key, required this.weatherDay});

  @override
  Widget build(BuildContext context) {
    ConfigCubit configCubit = context.read<ConfigCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            onPressed: () {
              configCubit.toggleDarkMode();
            },
            icon: configCubit.state.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeatherDayInfo(
            weatherDay: weatherDay,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Plus d\'informations sur ce jour...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
