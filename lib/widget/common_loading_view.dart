import 'package:flutter/material.dart';


class CommonLoadingView extends StatelessWidget {

  final Color backgroundColor;
  final Color progressColor;

  CommonLoadingView({
    this.backgroundColor = Colors.black26,
    this.progressColor = Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(progressColor)
        ),
      ),
    );
  }

}