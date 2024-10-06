part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherCubitInitial extends WeatherState {}

final class WeatherCubitLoading extends WeatherState {}

final class WeatherCubitLoaded extends WeatherState {
  final WeatherData weatherData;

  WeatherCubitLoaded({required this.weatherData});
}

final class WeatherCubitError extends WeatherState {
  final String message;

  WeatherCubitError({required this.message});
}
