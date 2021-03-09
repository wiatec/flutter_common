import 'package:url_launcher/url_launcher.dart';


class CommonLaunch{

  static void url(String url) {
    if(url != null && url.length > 0) {
      launch(url);
    }
  }

  static void call(String number) => launch("tel:$number");
  static void sendSms(String number) => launch("sms:$number");
  static void sendEmail(String email) => launch("mailto:$email");


}