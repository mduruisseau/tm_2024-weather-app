part of 'config_cubit.dart';

class ConfigState extends Equatable {
  final bool isDarkMode;

  const ConfigState({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];

  ConfigState copyWith({bool? isDarkMode}) {
    return ConfigState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
