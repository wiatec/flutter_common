import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonSystem{

  /// copy str to clipboard
  static copyToClipboard(String text) async {
    if (text == null || text.length <= 0) return;
    Clipboard.setData(ClipboardData(text: text));
  }

  /// get screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// get screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// get status bar height
  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

}