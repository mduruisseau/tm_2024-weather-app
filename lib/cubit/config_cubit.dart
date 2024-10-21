import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_1/services/storage_service.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  StorageService storageService = StorageService();

  ConfigCubit() : super(const ConfigState(isDarkMode: false)) {
    init();
  }

  Future<void> init() async {
    bool isDarkMode = await storageService.getDarkMode();
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  void toggleDarkMode() {
    bool isDarkMode = !state.isDarkMode;
    emit(state.copyWith(isDarkMode: isDarkMode));

    storageService.saveDarkMode(isDarkMode);
  }

  void setDarkMode(bool isDarkMode) {
    emit(state.copyWith(isDarkMode: isDarkMode));
    storageService.saveDarkMode(isDarkMode);
  }
}
