import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_common/common/common_aspect_ratio.dart';


class CommonNetworkImageView extends StatelessWidget {

  final String url;
  final String placeHolder;
  final double width;
  final Function onPress;
  final CommonAspectRatio aspectRatio;
  final BoxFit fit;

  CommonNetworkImageView(this.url, {
    this.placeHolder,
    this.width = double.infinity,
    this.onPress,
    this.aspectRatio = CommonAspectRatio.sixteenNine,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    double height = width / aspectRatio.value;
    return GestureDetector(
      onTapUp: (detail){
        if(onPress != null){
          onPress();
        }
      },
      child: Container(
        width: width,
        height: height,
        child: AspectRatio(
          aspectRatio: aspectRatio.value,
          child: url == null || url.length <= 0?
          placeHolder == null || placeHolder.length <= 0? PlaceHolderView(width, height): Image.asset(placeHolder, width: width, height: height,):
            CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => placeHolder == null || placeHolder.length <= 0? PlaceHolderView(width, height): Image.asset(placeHolder, width: width, height: height,),
              errorWidget: (context, url, error) => placeHolder == null || placeHolder.length <= 0? PlaceHolderView(width, height): Image.asset(placeHolder, width: width, height: height,),
              fit: fit,
            ),
        ),
      ),
    );
  }


}


class PlaceHolderView extends StatelessWidget {

  final double width;
  final double height;


  PlaceHolderView(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black26,
            Colors.black54,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
    );
  }
}