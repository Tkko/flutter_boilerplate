import 'package:flutter_boilerplate/app/router/app_router.gr.dart';
import 'package:get_it/get_it.dart';

export 'package:flutter/material.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_boilerplate/app/app.dart';
export 'package:flutter_boilerplate/app/router/app_router.gr.dart';
export 'package:flutter_boilerplate/app/config/app_config.dart';
export 'package:flutter_boilerplate/app/styles/app_colors.dart';
export 'package:flutter_boilerplate/app/styles/dimensions.dart';
export 'package:flutter_boilerplate/app/styles/app_theme.dart';

final GetIt getIt = GetIt.instance;

final AppRouter appRouter = AppRouter();
