import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_1/cubits/weather/weather_cubit.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/services/weather_service.dart';
import 'package:weather_app_1/views/weather_info.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        Widget content;
        bool showFloadingButton =
            state is WeatherCubitLoading || state is WeatherCubitLoaded;

        if (state is WeatherCubitInitial) {
          content = ElevatedButton(
            onPressed: () => context.read<WeatherCubit>().fetchData(),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Charger les données"),
            ),
          );
        } else if (state is WeatherCubitLoading) {
          content = const CircularProgressIndicator();
        } else if (state is WeatherCubitLoaded) {
          content = WeatherInfo(weatherData: state.weatherData);
        } else if (state is WeatherCubitError) {
          content = Text(state.message);
        } else {
          content = const Text("WeatherState inconnu");
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Météo"),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: Center(
            child: content,
          ),
          floatingActionButton: showFloadingButton
              ? FloatingActionButton.extended(
                  onPressed: state is WeatherCubitLoaded
                      ? () => context.read<WeatherCubit>().fetchData()
                      : null,
                  label: const Text("Rafraîchir"),
                  icon: const Icon(Icons.refresh),
                  disabledElevation: 0,
                )
              : null,
        );
      },
    );
  }
}
