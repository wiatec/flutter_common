import 'package:flutter/material.dart';

class CommonColor{

  /// generate color from any string
  static Color fromStr(String source) {
    if(source == null || source.length <= 0){
      return Colors.white;
    }else{
      final int hash = source.hashCode & 0xffff;
      final double hue = (360.0 * hash / (1 << 15)) % 360.0;
      return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
    }
  }


}

