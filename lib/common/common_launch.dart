import 'package:url_launcher/url_launcher.dart';


class CommonLaunch{

  static void url(String url) {
    if(url != null && url.length > 0) {
      launch(url);
    }
  }

}