part of 'weather_day_cubit.dart';

@immutable
sealed class WeatherDayState extends Equatable {}

final class WeatherDayInitial extends WeatherDayState {
  @override
  List<Object?> get props => [];
}

final class WeatherDaySelected extends WeatherDayState {
  final WeatherDay weatherDay;

  WeatherDaySelected(this.weatherDay);

  @override
  List<Object?> get props => [weatherDay];
}
