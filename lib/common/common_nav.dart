import 'package:flutter/material.dart';


Future<dynamic> push(BuildContext context, Widget widget) {
  return Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return widget;
  }));
}


bool pop<T extends Object> (BuildContext context, [T result]) {
  return Navigator.of(context).pop(result);
}


Future<dynamic> pushAndRemove(BuildContext context, Widget widget){
  return Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => route == null
  );
}