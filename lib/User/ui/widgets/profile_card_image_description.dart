import 'package:flutter/material.dart';
import 'package:untitled1/widgets/floating_action_button_green.dart';

class ProfileCardImageDescription extends StatelessWidget {
  String imageTitle = 'Knuckles Mountains Range';
  String imageActivities = 'Hiking, Water fall hunting, Natural bath, Scenery & Photography';
  int? likes = 404;
  String pathImage = 'assets/img/beach.jpeg';
  ProfileCardImageDescription(this.imageActivities, this.imageTitle, this.likes, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final cardContents = Center(
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              boxShadow: <BoxShadow>[BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15,
                  offset: Offset(0, 7)
              )]
          ),
          width: MediaQuery.of(context).size.width * .75,
          height: 115,
          child: Container(
            margin: const EdgeInsets.only(
                top: 15,
                bottom: 15,
                right: 10,
                left: 10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child:
                  Text(
                    imageTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      top: 5
                  ),
                  child:
                  Text(
                    imageActivities,
                    style: const TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey,
                      overflow: TextOverflow.fade,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  child:
                  Text(
                    'Heart $likes',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.orange
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
    return Stack(
      children: <Widget>[
        cardContents,
       /*
        Container(
          margin: EdgeInsets.only(
            top: 75,
            left: 280
          ),
          child: FloatingActionButtonGreen(iconData: Icons.favorite_border, onPressed: () {}),
        )

        */
      ],
    );
  }

}