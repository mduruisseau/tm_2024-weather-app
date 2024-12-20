import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_1/models/weather_data.dart';
import 'package:weather_app_1/services/weather_service.dart';

part 'weather_state.dart';

@singleton
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit({required this.weatherService}) : super(WeatherInitial());

  fetchData({
    required double lat,
    required double lng,
  }) async {
    emit(WeatherLoading());

    await Future.delayed(const Duration(seconds: 2));

    try {
      WeatherData data =
          await weatherService.fetchWeatherData(lat: lat, lng: lng);

      emit(WeatherLoaded(data));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  reset() {
    emit(WeatherInitial());
  }
}
