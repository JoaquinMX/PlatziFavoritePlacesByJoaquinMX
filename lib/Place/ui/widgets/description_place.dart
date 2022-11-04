import 'package:flutter/material.dart';
import 'package:untitled1/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  double stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);



  @override
  Widget build(BuildContext context) {
    final star_half = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),
      ),
    );

    final star_border = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2C611),
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    Container createStars() {

      var starsArray = [];
      for(var i = 0; i < stars; i++) {
        starsArray.add(star);
      }
      if (stars < 5 &&  stars % stars.toInt() != 0) {
        starsArray.add(star_half);
      }
      while (starsArray.length < 5) {
        print(starsArray.length);
          starsArray.add(star_border);
      }

      return Container(
        child: Row(
          children: <Widget>[
            starsArray[0],
            starsArray[1],
            starsArray[2],
            starsArray[3],
            starsArray[4],

          ],
        ),
      );
    }

    final description = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0
      ),
      child: Text(
        descriptionPlace,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Color(0xFF56575a)),
        textAlign: TextAlign.left,
      ),
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),
          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        createStars()
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        description,
        ButtonPurple(onPressed: () {  }, buttonText: 'Navigate')
      ],
    );
  }
}
