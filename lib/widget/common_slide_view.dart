import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class CommonSlideView extends StatelessWidget {

  final Widget child;
  final Function onEdit;
  final Function onDelete;
  final String editText;
  final String deleteText;

  CommonSlideView({
    @required this.child,
    this.onEdit,
    this.onDelete,
    this.editText = 'Edit',
    this.deleteText = 'Delete',
  });

  @override
  Widget build(BuildContext context) {
    List<IconSlideAction> actions = [];
    if(onEdit != null){
      actions.add(
        IconSlideAction(
            caption: editText,
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
              caption: deleteText,
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