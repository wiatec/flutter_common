import 'dart:async';

import 'package:package_info/package_info.dart';

class CommonString{


  static bool isEmpty(String str){
    return str == null || str.length <= 0;
  }

}