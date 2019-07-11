import 'package:flutter/material.dart';

class CommonArcClipOrientation  {

  final int value;

  const CommonArcClipOrientation(this.value);

  static const CommonArcClipOrientation topConvex = CommonArcClipOrientation(0x0001);
  static const CommonArcClipOrientation bottomConvex = CommonArcClipOrientation(0x0002);
  static const CommonArcClipOrientation topConcave = CommonArcClipOrientation(0x0004);
  static const CommonArcClipOrientation bottomConcave = CommonArcClipOrientation(0x0008);

}

class CommonArcClip extends StatelessWidget {

  final CommonArcClipOrientation orientation;
  final double arcHeight;
  final Widget child;

  CommonArcClip({
    this.orientation = CommonArcClipOrientation.bottomConvex,
    this.arcHeight = 40.0,
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: new ArcClipper(orientation, arcHeight),
      child: child,
    );
  }

}


class ArcClipper extends CustomClipper<Path> {

  final CommonArcClipOrientation orientation;
  final double arcHeight;

  ArcClipper(this.orientation, this.arcHeight);

  @override
  Path getClip(Size size) {
    var path = new Path();
    if(orientation == CommonArcClipOrientation.topConvex){
      path.moveTo(0.0, arcHeight);
      var firstControlPoint = Offset(size.width / 4, 0.0);
      var firstPoint = Offset(size.width / 2, 0.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);
      var secondControlPoint = Offset(size.width - (size.width / 4), 0.0);
      var secondPoint = Offset(size.width, arcHeight);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    }else if(orientation == CommonArcClipOrientation.bottomConvex){
      path.lineTo(0.0, size.height - arcHeight);
      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstPoint = Offset(size.width / 2, size.height);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);
      var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
      var secondPoint = Offset(size.width, size.height - arcHeight);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy);
      path.lineTo(size.width, 0.0);
      path.close();
    }else if(orientation == CommonArcClipOrientation.topConcave) {
      var firstControlPoint = Offset(size.width / 4, arcHeight);
      var firstPoint = Offset(size.width / 2, arcHeight);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);
      var secondControlPoint = Offset(size.width - (size.width / 4), arcHeight);
      var secondPoint = Offset(size.width, 0);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    }else if(orientation == CommonArcClipOrientation.bottomConcave){
      path.lineTo(0.0, size.height);
      var firstControlPoint = Offset(size.width / 4, size.height - arcHeight);
      var firstPoint = Offset(size.width / 2, size.height - arcHeight);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);
      var secondControlPoint = Offset(size.width - (size.width / 4), size.height - arcHeight);
      var secondPoint = new Offset(size.width, size.height);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy);
      path.lineTo(size.width, 0.0);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}