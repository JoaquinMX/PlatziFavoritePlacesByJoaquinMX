import 'package:flutter/material.dart';
import 'package:untitled1/User/model/user.dart';

class UserInfo extends StatelessWidget {

  late User user;

  UserInfo(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columnOfNameAndEmail = Flexible(
        child: Container(
          margin: EdgeInsets.only(
              top: 15,
              left: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.email,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.white60,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
    );

    final imageContainer = Container(
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(3),
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * .10,
            foregroundColor: Colors.white,
            backgroundImage: NetworkImage(user.photoURL),
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