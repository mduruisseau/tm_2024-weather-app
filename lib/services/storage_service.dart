import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_1/models/weather_day.dart';

class StorageService {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  saveDarkMode(bool darkMode) async {
    asyncPrefs.setBool("darkMode", darkMode);
  }

  Future<bool> getDarkMode() async {
    return await asyncPrefs.getBool("darkMode") ?? false;
  }

  saveSelectedDay(WeatherDay selectedDay) async {
    asyncPrefs.setString("selectedDay", jsonEncode(selectedDay.toJson()));
  }

  resetSelectedDay() async {
    asyncPrefs.remove("selectedDay");
  }

  Future<WeatherDay?> getSelectedDay() async {
    String? data = await asyncPrefs.getString("selectedDay");

    if (data != null) {
      return WeatherDay.fromJson(jsonDecode(data));
    }

    return null;
  }
}
