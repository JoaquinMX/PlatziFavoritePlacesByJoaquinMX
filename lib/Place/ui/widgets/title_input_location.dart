import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {

  late final String hintText;
  late final TextEditingController controller;
  final IconData iconData;

  TextInputLocation(this.controller, {Key? key, required this.iconData, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Lato',
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(iconData),
            fillColor: Colors.white,
             filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
          ),
        ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color:
            Colors.black12,
            blurRadius: 15.0,
            offset: Offset(0, 7.0),
          ),
        ]
      ),
    );
  }
}