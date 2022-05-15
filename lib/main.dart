import 'app/view/app_view.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const App());
}

void initDependencies() {
  getIt.registerSingleton<AppRouter>(appRouter);
}
