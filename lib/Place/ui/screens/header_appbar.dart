import 'package:flutter/material.dart';
import '../widgets/card_image_list.dart';
import '../../../widgets/gradient_back.dart';
class HeaderAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        GradientBack('Bienvenido', 250),
        CardImageList(),
      ],
    );
  }

}