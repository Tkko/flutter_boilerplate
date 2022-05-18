part of '../app.dart';

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

  void onAppStateChanged(_, AppState state) {}

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
        child: const LocalizeApp(),
      ),
    );
  }
}

class LocalizeApp extends StatelessWidget {
  const LocalizeApp({this.child, Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (_, AppState state) {
        if (state.status == LoadingStatus.loaded) {
          return MaterialApp.router(
            theme: state.theme,
            locale: state.locale,
            routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
            routerDelegate: getIt<AppRouter>().delegate(),
            localizationsDelegates: [
              AppLocalizations.delegate(AppConfig.supportedLocales),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppConfig.supportedLocales,
          );
        }

        return const SplashScreen();
      },
    );
  }
}
