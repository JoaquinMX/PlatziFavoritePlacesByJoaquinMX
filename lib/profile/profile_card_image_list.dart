import 'package:flutter/material.dart';
import 'profile_card_image.dart';


var steps = ['456,456,456', '123,123,123', '789,789,789'];
var imageActivities = ['Swimming, surfing, spa, sightseeking and fishing!', 'Hiking, Water fall hunting, Natural bath, Scenery & Photography', 'Look at the natural marvelous of Sumidero\'s Canyon'];
var imageTitle = ['Playa Hermosa Ensenada', 'Knuckles Mountains Range', 'Sumidero\'s Canyon'];
var pathImage = ['assets/img/beach.jpeg', 'assets/img/mountain.jpeg', 'assets/img/river.jpeg'];

class ProfileCardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        ProfileCardImage(steps[0], imageActivities[0], imageTitle[0], pathImage[0]),
        ProfileCardImage(steps[1], imageActivities[1], imageTitle[1], pathImage[1]),
        ProfileCardImage(steps[2], imageActivities[2], imageTitle[2], pathImage[2]),
      ],
    );
  }

}