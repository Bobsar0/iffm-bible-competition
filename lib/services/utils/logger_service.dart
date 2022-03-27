import 'package:flutter/foundation.dart';

class Logger {
  /// Logs a message to the console if the device is built in debug mode.
  /// Use case: The vast majority of logging messages should be sent here. We
  /// don't want to reveal too much to users viewing the logs about the inner
  /// workings of our application.
  ///
  /// [message] => the message you want to print to the console.
  static void logDebug(String message) => _log(message, LogLevel.debug);

  /// Logs a message to the console in any build configuration.
  /// Use case: The most important changes in the flow of the application should
  /// be logged here.
  ///
  /// [message] => the message you want to print to the console.
  static void logInformative(String message) => _log(message, LogLevel.info);

  /// Logs a message to the console in any build configuration.
  /// Use case: To warn the person viewing the logs that an issue has occurred
  /// that is not critical to the application functioning but is still wrong.
  ///
  /// [message] => the message you want to print to the console.
  static void logWarning(String message) => _log(message, LogLevel.warning);

  /// Logs a message to the console in any build configuration.
  /// Use case: When a critical exception occurs that for example prevents the
  /// user progressing further through the flow of the application.
  ///
  /// [message] => the message you want to print to the console.
  static void logCritical(String message) => _log(message, LogLevel.critical);

  // writes a log message to the console and to a log file.
  static void _log(String message, [LogLevel logLevel = LogLevel.debug]) {
    if (logLevel == LogLevel.debug && kReleaseMode) {
      return;
    }
    final dt = DateTime.now();
    final timeFormatted = "${dt.hour}:${dt.minute}:${dt.second}";
    final frames = StackTrace.current.toString().split("\n");
    var senderString = 'NO TRACE';
    if (frames.length > 2) {
      senderString = frames[2];
    }

    const String appName = "IFFM";
    final String fullMessage =
        '[$appName] [$timeFormatted] [$logLevel] [$senderString] $message';
    print(fullMessage);
  }
}

enum LogLevel { debug, info, warning, critical }
