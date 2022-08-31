import 'package:flutter/material.dart';

class ProfileBasicInfo extends StatelessWidget {
  String nameUser = 'Joaquin Beltran';
  String emailUser = 'contact@joaquinmx.com';
  String urlImage = 'https://media-exp1.licdn.com/dms/image/C5603AQGX8h4qEH8P3g/profile-displayphoto-shrink_800_800/0/1653651260333?e=1666828800&v=beta&t=b8JnSitKuhM1x95Gb1M23TvOoHzc-HKdjULhwkw4jxI';

  @override
  Widget build(BuildContext context) {

    final columnOfNameAndEmail = Container(
      margin: EdgeInsets.only(
        top: 25,
        left: 10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nameUser,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
          Text(
            emailUser,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );

    final imageContainer = Container(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(3),
        child: CircleAvatar(
          radius: 50,
          foregroundColor: Colors.white,
          backgroundImage: NetworkImage(urlImage),
        ),
      )
    );
    return Row(
      children: <Widget>[
        imageContainer,
        columnOfNameAndEmail,
      ],
    );
  }

}