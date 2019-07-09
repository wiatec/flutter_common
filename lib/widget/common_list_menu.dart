import 'package:flutter/material.dart';

class CommonListMenuInfo extends Object{

  String label;
  Color labelColor;
  String subTitle;
  Color subTitleColor;
  String iconRes;
  Icon icon;
  Color rightArrowColor;
  bool showRightArrow;
  int action;
  Function onItemTap;


  CommonListMenuInfo({
    this.label,
    this.labelColor = Colors.black87,
    this.subTitle,
    this.subTitleColor = Colors.black38,
    this.iconRes,
    this.icon,
    this.rightArrowColor = Colors.grey,
    this.showRightArrow = true,
    this.action = 0,
    this.onItemTap,
  });

  @override
  String toString() {
    return 'ListMenuInfo{label: $label, labelColor: $labelColor, subTitle: $subTitle, subTitleColor: $subTitleColor, iconRes: $iconRes, icon: $icon, rightArrowColor: $rightArrowColor, showRightArrow: $showRightArrow, action: $action}';
  }


}


class CommonListMenu extends StatelessWidget {

  final List<CommonListMenuInfo> menuInfoList;
  final Color highlightColor;
  final Color splashColor;


  CommonListMenu(
      {@required this.menuInfoList,
        this.highlightColor = Colors.blueAccent,
        this.splashColor = Colors.tealAccent,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: menuInfoList.map((info) {
          return buildItem(info);
        }).toList(),
      ),
    );
  }

  Widget buildItem(CommonListMenuInfo listMenuInfo){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          if (listMenuInfo.onItemTap != null){
            listMenuInfo.onItemTap();
          }
        },
        highlightColor: highlightColor,
        splashColor: splashColor,
        child: Container(
          width: double.infinity,
          height: 55.0,
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0, top: 15.0),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildIcon(listMenuInfo),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        listMenuInfo.label != null && listMenuInfo.label.length > 0? listMenuInfo.label: '',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: listMenuInfo.labelColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      listMenuInfo.subTitle != null && listMenuInfo.subTitle.length > 0 ?
                      Text(
                        listMenuInfo.subTitle,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: listMenuInfo.subTitleColor,
                        ),
                      ): SizedBox(),
                    ],
                  )
              ),
              listMenuInfo.showRightArrow?
              Icon(
                Icons.keyboard_arrow_right,
                color: listMenuInfo.rightArrowColor,
              ):
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcon(CommonListMenuInfo listMenuInfo){
    return Row(
      children: <Widget>[
        listMenuInfo.icon != null ?
        listMenuInfo.icon:
        listMenuInfo.iconRes != null && listMenuInfo.iconRes.length >0 ?
            Image.asset(
              listMenuInfo.iconRes,
              width: 30.0,
              height: 30.0,
            ):
            SizedBox(),
        listMenuInfo.icon != null || (listMenuInfo.iconRes != null && listMenuInfo.iconRes.length >0) ?
          SizedBox(width: 8.0,):
          SizedBox(),
      ],
    );
  }


}