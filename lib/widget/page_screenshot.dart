import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;


class PageScreenshot extends StatefulWidget {

  @override
  _PageScreenshotState createState() => _PageScreenshotState();

}

class _PageScreenshotState extends State<PageScreenshot> {

  GlobalKey key = GlobalKey();
  Uint8List images;

  Future<Uint8List> _capturePng() async {
    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    setState(() {
      images = pngBytes;
    });
    return pngBytes;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: key,
      child: Scaffold(
        appBar: AppBar(
          title: Text('sdf'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  _capturePng();
                },
                child: Text('sdf'),
              ),
              images != null? Image.memory(images): SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}