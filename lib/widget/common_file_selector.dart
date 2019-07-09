import 'package:flutter/material.dart';


class CommonFileSelector extends StatelessWidget {

  final Function onSelect;
  final Function onCancel;
  final String hintText;
  final String fileName;
  final String filePath;


  CommonFileSelector({
    this.onSelect,
    this.onCancel,
    this.hintText = 'Choose file',
    this.fileName,
    this.filePath
  });

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTapUp: (detail){
            if(onSelect != null) onSelect();
        },
        child: Container(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  fileName != null && fileName.length > 0?
                  fileName:
                  hintText != null && hintText.length > 0? hintText: '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey
                  ),
                ),
              ),
              SizedBox(width: 8.0,),
              filePath != null && filePath.length > 0?
              IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
                onPressed: () {
                  if(onCancel != null) onCancel();
                },
              ):
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );
  }


}