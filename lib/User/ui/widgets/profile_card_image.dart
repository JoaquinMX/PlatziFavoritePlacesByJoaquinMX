import 'package:flutter/material.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/User/ui/widgets/profile_card_image_description.dart';

class ProfileCardImage extends StatelessWidget {

  final Place place;

  const ProfileCardImage({super.key, required this.place});
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
              image: NetworkImage(place.urlImage)
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
          ProfileCardImageDescription(place.description, place.name, place.likes),
        )
      ],
    );
  }

}