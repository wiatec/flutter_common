import 'package:flutter/material.dart';
import 'package:flutter_common/flutter_common.dart';


class CommonNavigatorBar extends StatelessWidget {

  final bool showBtnBack;
  final IconData iconBack;
  final Color iconBackColor;
  final Function onBackPress;
  final String title;
  final double titleSize;
  final Color titleColor;
  final List<Widget> actions;


  CommonNavigatorBar({
    this.showBtnBack = true,
    this.iconBack = Icons.arrow_back_ios,
    this.iconBackColor = Colors.white,
    this.onBackPress,
    this.title = '',
    this.titleSize = 16.0,
    this.titleColor = Colors.white,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: buildChildren(context),
      ),
    );
  }

  List<Widget> buildChildren(BuildContext context) {
    List<Widget> list = [];
    if(showBtnBack) {
      list.add(IconButton(
        icon: Icon(iconBack, color: iconBackColor,),
        onPressed: onBackPress != null?(){
          onBackPress();
        }: (){
          pop(context);
        },
      ));
    }
    if(title != null && title.length > 0){
      list.add(Expanded(
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: titleSize,
            fontWeight: FontWeight.w500
          ),
        ),
      ));
    }
    if(actions != null && actions.length > 0){
      list.addAll(actions);
    }
    return list;
  }

}