import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/app/bloc/app_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Txt.body('author', textAlign: TextAlign.center),
          ...AppLocalizations.supportedLocales.map(
            (locale) => ChoiceChip(
              onSelected: (_) {
                context.read<AppCubit>().setLocale(locale);
              },
              selected: locale == context.locale,
              label: Txt.body(locale.languageCode),
            ),
          ),
        ],
      ),
    );
  }
}
