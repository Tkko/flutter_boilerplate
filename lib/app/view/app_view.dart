import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/app/bloc/app_cubit.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final AppCubit appCubit = AppCubit();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    appCubit.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        // TODO: Handle this case.
        return;
      case AppLifecycleState.resumed:
        // TODO: Handle this case.
        return;
      case AppLifecycleState.inactive:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.detached:
        // TODO: Handle this case.
        break;
    }
  }

  void onAppStateChanged(_, AppState state) {
    if (state is AppStateLoaded) {
      getIt<AppRouter>().replace(const HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide all global bloc/cubit(s) here
        BlocProvider.value(value: appCubit),
      ],
      child: BlocListener<AppCubit, AppState>(
        bloc: appCubit,
        listener: onAppStateChanged,
        child: MaterialApp.router(
          routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
          routerDelegate: getIt<AppRouter>().delegate(),
        ),
      ),
    );
  }
}

class LocalizeApp extends StatelessWidget {
  final Widget child;

  const LocalizeApp({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppConfig.supportedLocales,
      path: AppConfig.translationsPath,
      fallbackLocale: AppConfig.localeEn,
      child: child,
    );
  }
}
