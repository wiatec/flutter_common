import 'package:flutter/material.dart';


class CommonBottomMenu {

  static void show(BuildContext context, List<CommonBottomMenuItem> itemList){
    showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
      return BottomMenu(itemList);
    });
  }

}

class CommonBottomMenuItem {

  int position;
  IconData icon;
  String label;
  bool closeMenuAfterTap;
  Function onItemClick;

  CommonBottomMenuItem({
    this.position = 0,
    @required this.icon,
    @required this.label,
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

  BottomMenu(this.itemList);

  @override
  Widget build(BuildContext context) {
    itemList.sort((i1, i2){
      return i1.position - i2.position;
    });
    return Container(
      width: double.infinity,
      height: itemHeight * (itemList.length + 1) + paddingBorder * 3 + marginLine * 2,
      padding: EdgeInsets.only(
        top: paddingBorder,
        bottom: paddingBorder,
      ),
      child: buildItemList(itemList),
    );
  }


  Widget buildItemList(List<CommonBottomMenuItem> itemList){
    return ListView.builder(
      itemCount: itemList.length + 2,
      itemBuilder: (BuildContext context, int index) {
        if(index == itemList.length + 2 - 1){
          return buildListItem(context,
            CommonBottomMenuItem(
              icon: Icons.clear,
              label: 'Cancel',
            ),
          );
        }
        if(index == itemList.length + 2 - 2){
          return Container(
            color: Colors.black26,
            height: 0.5,
            margin: EdgeInsets.only(bottom: marginLine, top: marginLine),
          );
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
              color: Colors.black87,
            ),
            SizedBox(width: 16.0,),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}