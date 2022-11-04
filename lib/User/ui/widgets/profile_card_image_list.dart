import 'package:flutter/material.dart';
import 'package:untitled1/Place/model/place.dart';
import 'profile_card_image.dart';


var likes = [13, 116, 24];
var imageActivities = ['Swimming, surfing, spa, sightseeking and fishing!', 'Hiking, Water fall hunting, Natural bath, Scenery & Photography', 'Look at the natural marvelous of Sumidero\'s Canyon'];
var imageTitle = ['Playa Hermosa Ensenada', 'Knuckles Mountains Range', 'Sumidero\'s Canyon'];
var pathImage = ['https://images.unsplash.com/photo-1538964173425-93884d739596?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80', "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"];

class ProfileCardImageList extends StatelessWidget {

  Place place = Place(name: 'Playa Hermosa Ensenada', description: 'Swimming, surfing, spa, sightseeking and fishing!', urlImage: 'https://images.unsplash.com/photo-1538964173425-93884d739596?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80', likes: 13);
  Place place2 = Place(name: imageTitle[1], description: imageActivities[1], urlImage: pathImage[1], likes: likes[1]);
  Place place3 = Place(name: imageTitle[2], description: imageActivities[2], urlImage: pathImage[2], likes: likes[2]);
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        ProfileCardImage(place),
        ProfileCardImage(place2),
        ProfileCardImage(place3),
      ],
    );
  }

}