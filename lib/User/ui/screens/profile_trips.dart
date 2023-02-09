import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/User/model/user.dart';
import 'package:untitled1/User/ui/widgets/profile_card_image.dart';
import 'package:untitled1/User/ui/widgets/profile_card_image_list.dart';
import 'package:untitled1/widgets/gradient_back.dart';
import '../../bloc/bloc_user.dart';
import '../widgets/profile_basic_info.dart';
import '../widgets/profile_gradient_back.dart';
import 'package:untitled1/User/ui/widgets/profile_interact_buttons.dart';
import 'package:untitled1/User/ui/widgets/profile_card_image_description.dart';

String imageTitle = 'Knuckles Mountains Range';
String imageActivities = 'Hiking, Water fall hunting, Natural bath, Scenery & Photography';
String steps = '123,123,123';
String pathImage = 'assets/img/beach.jpeg';

class ProfileTrips extends StatelessWidget {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {

            case ConnectionState.none:
              return CircularProgressIndicator();
              break;
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;
            case ConnectionState.active:
              return showProfileData(snapshot, context);
              break;
            case ConnectionState.done:
              return showProfileData(snapshot, context);
              break;
            default:
              return showProfileData(snapshot, context);
              break;
          }
        }
    );
      
      
      /*
      Stack(
      children: <Widget>[
        GradientBack('Profile', MediaQuery.of(context).size.height * .5),
        Container(
          margin: EdgeInsets.only(
            top: 50,
            left: 30
          ),
          child: Text("Profile",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 101,
            left: 30
          ),
          child: ProfileBasicInfo()
        ),
      Container(
        margin: EdgeInsets.only(
          top: 221,
        ),
        child: ProfileInteractButtons(),
      ),
        Container(
          margin: EdgeInsets.only(
            top: 180
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: 125
            ),
            child: ProfileCardImageList(),
          ),
        )
      ],


    );
    */
  }

  Widget showProfileData(AsyncSnapshot snapshot, context) {
    if(!snapshot.hasData || snapshot.hasError) {
      print("No logged in");
      return Stack(
        children: <Widget>[
          GradientBack('Profile', MediaQuery.of(context).size.height * .5),
          Container(
            margin: EdgeInsets.only(
                top: 50,
                left: 30
            ),
            child: Text("Profile",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 101,
                  left: 30
              ),
              child: Text("No user logged. Please log in.")
          ),
        ],

      );
    }
    else {
      var user = User(uid: snapshot.data.uid, name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoURL);

      return Stack(
        children: <Widget>[
          GradientBack('Profile', MediaQuery.of(context).size.height * .5),
          Container(
            margin: EdgeInsets.only(
                top: 50,
                left: 30
            ),
            child: Text("Profile",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 101,
                  left: 30
              ),
              child: ProfileBasicInfo(user: user)
          ),
          Container(
            margin: EdgeInsets.only(
              top: 221,
            ),
            child: ProfileInteractButtons(),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 180
            ),
            child: Container(
              margin: EdgeInsets.only(
                  top: 125
              ),
              child: ProfileCardImageList(user: user),
            ),
          )
        ],


      );
    }
  }
}