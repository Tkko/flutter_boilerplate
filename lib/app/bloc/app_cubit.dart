import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/common/data/data_sources/localization_remote_data_source_impl.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(status: LoadingStatus.loading));

    final locale = await AppLocalizations.init(
      AppConfig.localizationConfig.copyWith(),
      remoteDataSource: LocalizationRemoteDataSourceImpls(),
    );

    emit(
      state.copyWith(
        status: LoadingStatus.loaded,
        locale: locale,
        theme: ThemeData.light(),
      ),
    );
  }

  void setLocale(Locale locale) {
    if (state.locale == locale) return;
    emit(state.copyWith(locale: locale));
  }

  void setTheme() {}
}
