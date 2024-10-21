import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_1/models/weather_day.dart';
import 'package:weather_app_1/services/storage_service.dart';

part 'weather_day_state.dart';

class WeatherDayCubit extends Cubit<WeatherDayState> {
  StorageService storageService = StorageService();
  WeatherDayCubit() : super(WeatherDayInitial()) {
    init();
  }

  void init() async {
    WeatherDay? data = await storageService.getSelectedDay();

    if (data != null) {
      emit(WeatherDaySelected(data));
    }
  }

  void selectWeatherDay(WeatherDay weatherDay) {
    emit(WeatherDaySelected(weatherDay));
    storageService.saveSelectedDay(weatherDay);
  }

  void reset() {
    emit(WeatherDayInitial());
    storageService.resetSelectedDay();
  }
}
