import 'common_time.dart';

void log(String msg) {
  if(msg == null || msg.length <= 0){
    msg = 'null or empty';
  }
  print(" =====>> " + CommonTime.timeStampToStr(CommonTime.currentTimeStamp()) + "  " + msg);
}
