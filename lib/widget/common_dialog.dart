import 'package:flutter/material.dart';

class CommonDialog{

  static void show<T>(BuildContext context,
      {String msg = 'Confirm to do this?',
        Function onConfirm,
        bool showCancel = true,
        String cancelLabel = 'CANCEL',
        String conformLabel = 'CONFIRM'
      }) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          content: Text(
            msg,
            style: TextStyle(
                fontSize: 18.0
            ),
          ),
          actions: <Widget>[
            showCancel?? FlatButton(
                child: Text(cancelLabel, style: TextStyle(color: Colors.grey),),
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
            FlatButton(
                child: Text(conformLabel, style: TextStyle(color: Colors.blueAccent),),
                onPressed: () {
                  Navigator.pop(context);
                  if(onConfirm != null) onConfirm();
                }
            ),
          ]
      ),
    );
  }
}

