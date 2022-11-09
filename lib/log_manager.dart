import 'package:yald/logger.dart';

import 'log_levels.dart';

class LogManager {
  static final _LogManagerInstance _instance = _LogManagerInstance();

  static void config(Map<String, LogLevel> config, {appName = "APP"}) {
    _instance.config(config, appName: appName);
  }

  static Logger loggerFor(String name) {
    return _instance.loggerFor(name);
  }
}

class _LogManagerInstance {
  late String appName;
  late Map<String, LogLevel> configuration = {};

  void config(Map<String, LogLevel> config, {appName = "APP"}) {
    this.appName = appName;
    configuration = config;
    if (configuration["root"] == null) {
      configuration['root'] = LogLevel.ALL;
    }
  }

  void _configure(){
    if(configuration.keys.isEmpty) {
      configuration['root'] = LogLevel.ALL;
    }
  }

  Logger loggerFor(String name) {
    _configure();

    LogLevel? level;
    configuration.forEach((key, value) {
      if (key == name) {
        level = value;
      }
    });

    level ??= configuration['root'];

    bool found = false;
    Map<LogLevel, bool> config = {};
    for (var value in LogLevel.values) {
      if (value == level) {
        config[value] = true;
        found = true;
      } else if (found == false) {
        config[value] = true;
      } else if (found == true) {
        config[value] = false;
      }
    }

    return Logger(appName: appName, loggerName: name, config: config);
  }
}
