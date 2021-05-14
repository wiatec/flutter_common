import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {

  final String title;
  final String subtitle;
  final EdgeInsetsGeometry padding;
  final leadingColor;
  final textColor;
  final subtitleColor;

  CommonHeader(this.title, {
    this.subtitle = '',
    this.padding = const EdgeInsets.all(0),
    this.leadingColor = Colors.black87,
    this.textColor = Colors.black87,
    this.subtitleColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        children: [
          Container(
            height: 15,
            width: 3,
            color: leadingColor,
          ),
          SizedBox(width: 8,),
          Text(
            '$title',
            style: TextStyle(
              color: textColor,
              fontSize: 18
            ),
          ),
          SizedBox(width: 8,),
          Text(
            '$subtitle',
            style: TextStyle(
              fontSize: 13,
              color: subtitleColor
            ),
          ),
        ],
      ),
    );
  }



}