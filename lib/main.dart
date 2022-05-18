import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'app/bloc/app_bloc_observer.dart';

void main() {
  bootstrap(() => const App());
}

Future<void> initDependencies() async {
  getIt.registerSingleton<AppRouter>(appRouter);
  final localStorage = LocalStorage(Hive);
  await localStorage.init();
  getIt.registerSingleton<LocalStorage>(localStorage);
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          await initDependencies();
          runApp(await builder());
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
