import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_localizations/app_localizations.dart';
import 'package:flutter_boilerplate/features/splash/view/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'config/app_config.dart';
import 'router/app_router.gr.dart';
import 'bloc/app_cubit.dart';

export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_boilerplate/app/app.dart';
export 'package:flutter_boilerplate/app/router/app_router.gr.dart';
export 'package:flutter_boilerplate/app/config/app_config.dart';
export 'package:flutter_boilerplate/app/styles/app_colors.dart';
export 'package:flutter_boilerplate/app/styles/dimensions.dart';
export 'package:flutter_boilerplate/app/styles/app_theme.dart';
export 'package:app_localizations/app_localizations.dart';
export 'package:flutter_boilerplate/common/widgets/txt.dart';
export 'package:flutter_boilerplate/common/data/failures.dart';
export 'package:flutter_boilerplate/common/services/storage/local_storage.dart';
export 'package:dartz/dartz.dart' hide State;

part 'view/app_view.dart';

final GetIt getIt = GetIt.instance;

final AppRouter appRouter = AppRouter();

final Logger logger = Logger(
  printer: PrettyPrinter(lineLength: 80),
);

bool get isDebugMode => kDebugMode;

// The only place to log anything
void log(
  String message, {
  dynamic error,
  StackTrace? stackTrace,
}) {
  if (error != null) {
    // Todo: Log to Crashlytics
    logger.e(message, error, stackTrace);
  } else {
    logger.d(message, error, stackTrace);
  }
}
