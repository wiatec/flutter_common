import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CommonListMenuInfo extends Object{

  Color backgroundColor;
  String label;
  Color labelColor;
  double labelSize;
  FontWeight labelFontWeight;
  String subTitle;
  Color subTitleColor;
  double subTitleSize;
  String iconRes;
  Widget rightWidget;
  String rightLabel;
  Color rightLabelColor;
  double rightLabelSize;
  Icon icon;
  Color rightArrowColor;
  bool showRightArrow;
  int action;
  Function onItemTap;
  Function onEdit;
  Function onDelete;


  CommonListMenuInfo({
    this.backgroundColor = Colors.transparent,
    this.label,
    this.labelColor = Colors.black87,
    this.labelSize = 15.0,
    this.labelFontWeight = FontWeight.w500,
    this.subTitle,
    this.subTitleColor = Colors.black38,
    this.subTitleSize = 12.0,
    this.iconRes,
    this.icon,
    this.rightWidget,
    this.rightLabel = "",
    this.rightLabelColor = Colors.black54,
    this.rightLabelSize = 12.0,
    this.rightArrowColor = Colors.grey,
    this.showRightArrow = true,
    this.action = 0,
    this.onItemTap,
    this.onEdit,
    this.onDelete,
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

  Widget buildItem(CommonListMenuInfo info){
    Widget child =  Material(
      color: info.backgroundColor,
      child: InkWell(
        onTap: (){
          if (info.onItemTap != null){
            info.onItemTap();
          }
        },
        highlightColor: highlightColor,
        splashColor: splashColor,
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0, top: 15.0),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: buildWidgetList(info),
          ),
        ),
      ),
    );
    List<IconSlideAction> actions = [];
    if(info.onEdit != null){
      actions.add(
          IconSlideAction(
              caption: 'Edit',
              color: Colors.blue,
              icon: Icons.edit,
              onTap: () {
                info.onEdit();
              }
          )
      );
    }
    if(info.onDelete != null){
      actions.add(
          IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                info.onDelete();
              }
          )
      );
    }
    if(actions.length > 0){
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: child,
        secondaryActions: actions,
      );
    }else {
      return child;
    }
  }

  List<Widget> buildWidgetList(CommonListMenuInfo info){
    List<Widget> list = [];
    list.add(buildIcon(info));
    list.add(Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              info.label != null && info.label.length > 0? info.label: '',
              style: TextStyle(
                fontSize: info.labelSize,
                color: info.labelColor,
                fontWeight: info.labelFontWeight,
              ),
            ),
            info.subTitle != null && info.subTitle.length > 0 ?
            Text(
              info.subTitle,
              style: TextStyle(
                fontSize: info.subTitleSize,
                color: info.subTitleColor,
              ),
            ): SizedBox(),
          ],
        )
    ));
    if(info.rightWidget != null){
      list.add(info.rightWidget);
    }else{
      list.add(Text(
        info.rightLabel,
        style: TextStyle(
          fontSize: info.rightLabelSize,
          color: info.rightLabelColor,
        ),
      ),);
      list.add(SizedBox(width: 3.0,),);
      if(info.showRightArrow){
        list.add(Icon(
          Icons.keyboard_arrow_right,
          color: info.rightArrowColor,
        ));
      }

    }
    return list;
  }

  Widget buildIcon(CommonListMenuInfo listMenuInfo){
    return Row(
      children: <Widget>[
        listMenuInfo.icon != null ?
        listMenuInfo.icon:
        listMenuInfo.iconRes != null && listMenuInfo.iconRes.length >0 ?
        listMenuInfo.iconRes.startsWith("http")? Image.network(
          listMenuInfo.iconRes,
          width: 30.0,
          height: 30.0,
        ): Image.asset(
              listMenuInfo.iconRes,
              width: 30.0,
              height: 30.0,
            ): SizedBox(),
        listMenuInfo.icon != null || (listMenuInfo.iconRes != null && listMenuInfo.iconRes.length >0) ?
          SizedBox(width: 8.0,): SizedBox(),
      ],
    );
  }


}