import 'package:flutter/material.dart';


class CommonListFilter extends StatelessWidget {

  static final List<String> keyList = [
    '#',
    'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q',      'R', 'S', 'T',
    'U', 'V', 'W',      'X', 'Y', 'Z',
  ];

  final Function onFilter;
  final double marginTop;
  final double itemWidth;
  final double itemHeight;
  final double textSize;
  final Color textColor;


  CommonListFilter({
    this.onFilter,
    this.marginTop = 60.0,
    this.itemWidth = 26.0,
    this.itemHeight = 17.0,
    this.textSize = 10.0,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(top: marginTop),
        height: keyList.length * itemHeight,
        child: Column(
          children: keyList.map((key){
            return buildItem(key);
          }).toList(),
        ),
      )
    );
  }
  
  
  Widget buildItem(String key){
    return GestureDetector(
        onTapUp: (detail){
          if(onFilter != null){
            onFilter(key);
          }
        },
        child: Container(
            width: itemWidth,
            height: itemHeight,
            color: Colors.transparent,
            child: Center(
              child: Text(
                key,
                style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
        )
    );
  }
}