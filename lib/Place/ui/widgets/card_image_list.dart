import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(20, pathImage: 'assets/img/beach.jpeg', iconData: Icons.favorite_border, width: 350, height: 250, onPressedFabIcon: () => {}),
          CardImageWithFabIcon(20, pathImage: 'assets/img/beach_palm.jpeg', iconData: Icons.favorite_border, width: 350, height: 250, onPressedFabIcon: () => {}),
          CardImageWithFabIcon(20, pathImage: 'assets/img/mountain.jpeg', iconData: Icons.favorite_border, width: 350, height: 250, onPressedFabIcon: () => {}),
          CardImageWithFabIcon(20, pathImage: 'assets/img/mountain_stars.jpeg', iconData: Icons.favorite_border, width: 350, height: 250, onPressedFabIcon: () => {}),
          CardImageWithFabIcon(20, pathImage: 'assets/img/river.jpeg', iconData: Icons.favorite_border, width: 350, height: 250, onPressedFabIcon: () => {}),
          CardImageWithFabIcon(20, pathImage: 'assets/img/sunset.jpeg', iconData: Icons.favorite_border, width: 350, height: 250, onPressedFabIcon: () => {})
        ],
      ),
    );
  }
}