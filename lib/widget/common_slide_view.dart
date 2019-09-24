import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class CommonSlideView extends StatelessWidget {

  final Widget child;
  final Function onEdit;
  final Function onDelete;

  CommonSlideView({
    @required this.child,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    List<IconSlideAction> actions = [];
    if(onEdit != null){
      actions.add(
        IconSlideAction(
            caption: 'Edit',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {
              onEdit();
            }
        )
      );
    }
    if(onDelete != null){
      actions.add(
          IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                if(onDelete != null) onDelete();
              }
          )
      );
    }

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: child,
      secondaryActions: actions,
    );
  }


}