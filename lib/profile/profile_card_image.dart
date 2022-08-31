import 'package:flutter/material.dart';
import 'package:untitled1/profile/profile_card_image_description.dart';

class ProfileCardImage extends StatelessWidget {

  String pathImage = 'assets/img/beach.jpeg';
  String imageTitle = 'Knuckles Mountains Range';
  String imageActivities = 'Hiking, Water fall hunting, Natural bath, Scenery & Photography';
  String steps = '123,123,123';

  ProfileCardImage(this.steps, this.imageActivities, this.imageTitle, this.pathImage);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: MediaQuery.of(context).size.width * .95,

      height: MediaQuery.of(context).size.height * .33,
      margin: EdgeInsets.only(
        left: 10.0,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pathImage)
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[BoxShadow(
              color: Colors.black38,
              blurRadius: 15.0,
              offset: Offset(0.0, 7.0)
          )]
      ),
    );
    return Stack(
      children: <Widget>[
        card,
        Container(
          margin: EdgeInsets.only(
            top: 185,
            bottom: 20
          ),
          child:
          ProfileCardImageDescription(imageActivities, imageTitle, steps),
        )
      ],
    );
  }

}