import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppStateInitial()) {
    init();
  }

  void init() async {
    emit(AppStateLoading());
    await EasyLocalization.ensureInitialized();
    // Todo: initialize stuff
    emit(AppStateLoaded());
  }
}
