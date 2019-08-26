import 'package:logger/logger.dart' as prefix0;

import 'common_time.dart';
import 'package:logger/logger.dart';

void log(dynamic msg) {
  if(msg == null){
    msg = 'null';
  }
  print(" =====>> " + CommonTime.timeStampToStr(CommonTime.currentTimeStamp()) + "  " + msg.toString());
}

class Log{

  static var logger = prefix0.Logger();

  static void i(dynamic message){
    logger.i(message);
  }

  static void d(dynamic message){
    logger.d(message);
  }

  static void w(dynamic message){
    logger.w(message);
  }

  static void e(dynamic message){
    logger.e(message);
  }


}
