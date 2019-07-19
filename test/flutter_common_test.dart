import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_common/flutter_common.dart';
import 'package:flutter/material.dart';

void main() {

  test("common app", (){
  });

  test("common color", (){
    expect(CommonColor.fromStr(''), Colors.white);
  });

  test("common log", (){
    log('fsfs');
  });

}
