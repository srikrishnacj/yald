import 'package:yald/log_levels.dart';
import 'package:yald/log_manager.dart';
import 'package:yald/logger.dart';

import '../bin/yald.dart';


void main(){
  Map<String, LogLevel> config = {};

  config["TEST1"] = LogLevel.OFF;
  config["TEST2"] = LogLevel.INFO;
  config["TEST3"] = LogLevel.ALL;
  config["root"] = LogLevel.ALL;

  LogManager.config(config);

  Logger log1 = LogManager.loggerFor("TEST1");
  Logger log2 = LogManager.loggerFor("TEST2");
  Logger log3 = LogManager.loggerFor("TEST3");


  log1.all("This is all msg");
  log1.trace("This is trace msg");
  log1.debug("This is debug msg");
  log1.info("This is info msg");
  log1.warn("This is warn msg");
  log1.error("This is error msg");
  log1.fatal("This is fatal msg");

  print("");
  print("");
  print("");

  log2.all("This is all msg");
  log2.trace("This is trace msg");
  log2.debug("This is debug msg");
  log2.info("This is info msg");
  log2.warn("This is warn msg");
  log2.error("This is error msg");
  log2.fatal("This is fatal msg");

  print("");
  print("");
  print("");

  log3.all("╔This is all msg");
  log3.trace("║This is trace msg");
  log3.debug("║This is debug msg");
  log3.info("║This is info msg");
  log3.warn("║This is warn msg");
  log3.error("║This is error msg");
  log3.fatal("╚This is fatal msg");


  print("╔test");
  print("║test");
  print("╚test");

}