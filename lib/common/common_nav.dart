import 'package:flutter/material.dart';


push(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return widget;
  }));
}

bool pop<T extends Object> (BuildContext context, [T result]) {
  return Navigator.pop(context, result);
}

pushAndRemove(BuildContext context, Widget widget){
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => route == null
  );
}