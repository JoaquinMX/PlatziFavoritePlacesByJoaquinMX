import 'package:flutter/material.dart';
import 'review.dart';
class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String pathImage = "assets/img/people.jpg";
    String name = "Varuna Yasas";
    String details = "1 review 5 photos";
    String comment = "There is an amazing place in Sri Lanka";

    return Column(
      children: <Widget>[
        Review(pathImage, name, details, comment),
        Review(pathImage, 'Joaquin Beltran', details, 'Wow'),
        Review(pathImage, name, details, comment),
      ],
    );
  }

}