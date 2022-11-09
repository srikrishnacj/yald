import 'package:yald/log_levels.dart';

class Logger {
  final String appName;
  final String loggerName;
  final Map<LogLevel, bool> config;

  Logger({required this.appName, required this.loggerName, required this.config});

  void f(String message) {
    fatal(message);
  }

  void fatal(String message) {
    _log(message, LogLevel.FATAL);
  }

  void e(String message) {
    error(message);
  }

  void error(String message) {
    _log(message, LogLevel.ERROR);
  }

  void w(String message) {
    warn(message);
  }

  void warn(String message) {
    _log(message, LogLevel.WARN);
  }

  void i(String message) {
    info(message);
  }

  void info(String message) {
    _log(message, LogLevel.INFO);
  }

  void d(String message) {
    debug(message);
  }

  void debug(String message) {
    _log(message, LogLevel.DEBUG);
  }

  void t(String message) {
    trace(message);
  }

  void trace(String message) {
    _log(message, LogLevel.TRACE);
  }

  void a(String message) {
    all(message);
  }

  void all(String message) {
    _log(message, LogLevel.ALL);
  }

  void _log(String message, LogLevel level) {
    if (config[level] == true) {
      print("[$appName] [${level.name.padLeft(5)}] ${loggerName.padLeft(20)} $message");
    }
  }
}
