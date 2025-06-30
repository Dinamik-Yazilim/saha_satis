import 'dart:async';

import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../state/container/product_state_container.dart';
import '../state/view_model/product_view_model.dart';
import 'config/app_environment.dart';
import 'database/database_initializer.dart';

@immutable
///This class is used to initialize the application process
final class ApplicationInitialize {
  ///Project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) => Logger().e(error));
  }

  static Future<void> _initialize() async {
    AppLogger.disableAll();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };

    AppEnvironment.general();
    ProductContainer.setup();
    await DatabaseInitializer().initializeDatabase();
    ProductContainer.read<ProductViewModel>();
  }
}
