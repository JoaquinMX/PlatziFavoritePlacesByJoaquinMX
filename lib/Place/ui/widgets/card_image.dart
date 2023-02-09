import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {

  final double height;
  final double width;
  double left;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  final String pathImage;
  CardImageWithFabIcon(
    this.left,
    {
      Key? key,
      required this.pathImage,
      required this.width,
      required this.height,
      required this.onPressedFabIcon,
      required this.iconData,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
        left: left,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            //image: internet ? CachedNetworkImageProvider(pathImage) as ImageProvider : AssetImage(pathImage)
                image:
            pathImage.contains('http')
                ? CachedNetworkImageProvider(pathImage) as ImageProvider
                : FileImage(File(pathImage))


        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[BoxShadow(
          color: Colors.black38,
          blurRadius: 15.0,
          offset: Offset(0.0, 7.0)
        )]
      ),
    );

    return Stack(
      alignment: Alignment(.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData, onPressed: onPressedFabIcon,)
      ],
    );
  }

}