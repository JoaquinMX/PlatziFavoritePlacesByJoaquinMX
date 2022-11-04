import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {

  late final String title;

  TitleHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double widthScreen = MediaQuery.of(context).size.width;

    return Container(
      width: widthScreen - (widthScreen / 2),
      child:  FittedBox(
        fit: BoxFit.contain,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24,
              fontFamily: "Lato",
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
  
}