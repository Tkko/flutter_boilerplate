import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/common/widgets/app_loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLoader(),
      ),
    );
  }
}
