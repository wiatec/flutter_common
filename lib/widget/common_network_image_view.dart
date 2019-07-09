import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_common/common/common_aspect_ratio.dart';


class CommonNetworkImageView extends StatelessWidget {

  final String url;
  final Function onPress;
  final CommonAspectRatio aspectRatio;

  CommonNetworkImageView(this.url, {this.onPress, this.aspectRatio = CommonAspectRatio.sixteenNine});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (detail){
        if(onPress != null){
          onPress();
        }
      },
      child: Container(
        child: AspectRatio(
          aspectRatio: aspectRatio.value,
          child: url == null || url.length <= 0?
          PlaceHolderView():
          CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => PlaceHolderView(),
            errorWidget: (context, url, error) => PlaceHolderView(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


}


class PlaceHolderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
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