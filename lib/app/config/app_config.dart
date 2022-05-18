import 'package:app_localizations/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class AppConfig {
  const AppConfig._();

  static const localeEn = Locale('en');
  static const localeKa = Locale('ka');
  static const defaultLocale = localeKa;
  static const supportedLocales = [localeEn, localeKa];
  static const translationsPath = 'assets/translations/';
  static const localizationConfig = LocalizationConfig(
    defaultLocale: defaultLocale,
    localTranslationsPath: translationsPath,
  );
}
