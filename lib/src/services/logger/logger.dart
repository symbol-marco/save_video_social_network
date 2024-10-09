import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static late final Logger log;
  static late final File logFile;

  static initialize(bool verbose) {
    log = Logger(
        level:
            kDebugMode || (verbose && kReleaseMode) ? Level.all : Level.info);
  }

  static R? runZoned<R>(R Function() body) {
    return runZonedGuarded<R>(body, (error, stackTrace) {});
  }

  static Future<void> reportError(dynamic error,
      [StackTrace? stackTrace, message = ""]) async {
    log.e(message, error: error, stackTrace: stackTrace);

    if (kReleaseMode) {
      await logFile.writeAsString(
          "[${DateTime.now()}]--------------------------\n"
          "$error\n$stackTrace\n"
          "----------------------------------------------\n",
          mode: FileMode.writeOnlyAppend);
    }
  }
}

class AppLoggerProviderObserver extends ProviderObserver {
  const AppLoggerProviderObserver();

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    AppLogger.reportError(error, stackTrace);
  }
}
