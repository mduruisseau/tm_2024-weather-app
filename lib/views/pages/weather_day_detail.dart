import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_1/cubit/air_quality_cubit.dart';
import 'package:weather_app_1/cubit/air_quality_state.dart';
import 'package:weather_app_1/cubit/config_cubit.dart';
import 'package:weather_app_1/models/weather_air_hour_quality.dart';
import 'package:weather_app_1/models/weather_air_hourly_quality.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/models/weather_hour.dart';
import 'package:weather_app_1/views/widgets/weather_air_means_info.dart';
import 'package:weather_app_1/views/widgets/weather_air_quality_hour_info.dart';
import 'package:weather_app_1/views/widgets/weather_day_info.dart';
import 'package:weather_app_1/views/widgets/weather_hour_info.dart';

class WeatherDayDetail extends StatelessWidget {
  final WeatherDay weatherDay;

  const WeatherDayDetail({super.key, required this.weatherDay});

  @override
  Widget build(BuildContext context) {
    ConfigCubit configCubit = context.read<ConfigCubit>();

    return BlocProvider(
      create: (context) => AirQualityCubit()
        ..fetchData(
          day: weatherDay.time,
        ),
      child: Scaffold(
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
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  WeatherHour weatherHour = weatherDay.hours[index];

                  return Column(
                    children: [
                      WeatherHourInfo(
                        weatherHour: weatherHour,
                      ),
                      BlocBuilder<AirQualityCubit, AirQualityState>(
                        builder: (context, state) {
                          if (state is AirQualityLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is AirQualityLoaded) {
                            WeatherAirHourQuality weatherAirHour =
                                state.airQuality.hourly.getHours()[index];

                            return WeatherAirQualityHourInfo(
                              weatherHour: weatherAirHour,
                            );
                          }

                          return const Placeholder();
                        },
                      ),
                    ],
                  );
                },
                itemCount: weatherDay.hours.length,
              ),
            ),
            const Divider(),
            BlocBuilder<AirQualityCubit, AirQualityState>(
              builder: (context, state) {
                if (state is AirQualityLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AirQualityLoaded) {
                  WeatherAirHourlyQuality weatherHour = state.airQuality.hourly;

                  return WeatherAirMeansInfo(weatherHour: weatherHour);
                }

                return const Placeholder();
              },
            ),
            const Divider(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text("Retour"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
