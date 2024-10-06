import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherCubitInitial());

  void fetchData() async {
    emit(WeatherCubitLoading());

    await Future.delayed(const Duration(seconds: 2));

    try {
      WeatherData data = await WeatherService().fetchWeatherData();
      emit(WeatherCubitLoaded(weatherData: data));
    } catch (e) {
      emit(WeatherCubitError(message: e.toString()));
    }
  }
}
