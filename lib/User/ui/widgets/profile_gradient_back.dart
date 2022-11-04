import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileGradientBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen,
      height: heightScreen * .5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF4268D3),
                Color(0xFF584CD1)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          )
      ),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.2, -1),
        child: Container(
          width: heightScreen * 2,
          height: heightScreen,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              borderRadius: BorderRadius.circular(heightScreen)
          ),
        ),
      ),
    );
  }

}