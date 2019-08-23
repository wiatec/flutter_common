import 'package:flutter/material.dart';


class CommonBottomMenu {

  static void show(BuildContext context, {@required List<CommonBottomMenuItem> itemList, bool showCancel = true}){
    showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
      return BottomMenu(itemList, showCancel: showCancel,);
    });
  }

}

class CommonBottomMenuItem {

  int position;
  IconData icon;
  Color iconColor;
  String label;
  Color labelColor;
  double labelSize;
  bool closeMenuAfterTap;
  Function onItemClick;

  CommonBottomMenuItem({
    this.position = 0,
    @required this.icon,
    this.iconColor = Colors.black87,
    @required this.label,
    this.labelColor = Colors.black87,
    this.labelSize = 15.0,
    this.onItemClick,
    this.closeMenuAfterTap = true
  });

}


class BottomMenu extends StatelessWidget {

  final double paddingBorder = 8.0;
  final double marginLine = 4.0;
  final double itemHeight = 50.0;
  final double paddingItemVer = 12.0;
  final double paddingItemHor = 8.0;
  final List<CommonBottomMenuItem> itemList;
  final bool showCancel;

  BottomMenu(this.itemList, {this.showCancel = true});

  @override
  Widget build(BuildContext context) {
    itemList.sort((i1, i2){
      return i1.position - i2.position;
    });
    return Container(
      width: double.infinity,
      height: itemHeight * (showCancel? itemList.length + 1: itemList.length) + paddingBorder * 3 + (showCancel? marginLine * 2: 0),
      padding: EdgeInsets.only(
        top: paddingBorder,
        bottom: paddingBorder,
      ),
      child: buildItemList(itemList),
    );
  }


  Widget buildItemList(List<CommonBottomMenuItem> itemList){
    return ListView.builder(
      itemCount: showCancel? itemList.length + 2: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        if(showCancel) {
          if (index == itemList.length + 2 - 1) {
            return buildListItem(context,
              CommonBottomMenuItem(
                icon: Icons.clear,
                label: 'Cancel',
              ),
            );
          }
          if (index == itemList.length + 2 - 2) {
            return Container(
              color: Colors.black26,
              height: 0.5,
              margin: EdgeInsets.only(bottom: marginLine, top: marginLine),
            );
          }
        }
        return buildListItem(context, itemList[index]);
      },
    );
  }

  Widget buildListItem(BuildContext context, CommonBottomMenuItem item){
    return GestureDetector(
      onTapUp: (details){
        if(item.onItemClick != null){
          item.onItemClick();
        }
        if(item.closeMenuAfterTap){
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          top: paddingItemVer,
          bottom: paddingItemVer,
          left: paddingItemHor,
          right: paddingItemHor,
        ),
        color: Colors.transparent,
        width: double.infinity,
        height: itemHeight,
        child: Row(
          children: <Widget>[
            Icon(
              item.icon,
              color: item.iconColor,
            ),
            SizedBox(width: 16.0,),
            Text(
              item.label,
              style: TextStyle(
                fontSize: item.labelSize,
                color: item.labelColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}