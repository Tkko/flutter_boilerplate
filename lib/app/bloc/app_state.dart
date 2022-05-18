part of 'app_cubit.dart';

enum LoadingStatus {
  initial,
  loading,
  loaded,
  failed,
}

class AppState {
  final Locale locale;
  final ThemeData? theme;
  final ThemeMode themeMode;
  final LoadingStatus status;

  AppState({
    this.theme,
    this.themeMode = ThemeMode.system,
    this.locale = AppConfig.defaultLocale,
    this.status = LoadingStatus.initial,
  });

  AppState copyWith({
    Locale? locale,
    ThemeData? theme,
    ThemeMode? themeMode,
    LoadingStatus? status,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
      status: status ?? this.status,
    );
  }
}
