import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/Place/model/place.dart';
import '../../bloc/bloc_user.dart';
import '../../model/user.dart';
import 'profile_card_image.dart';


var likes = [13, 116, 24];
var imageActivities = ['Swimming, surfing, spa, sightseeking and fishing!', 'Hiking, Water fall hunting, Natural bath, Scenery & Photography', 'Look at the natural marvelous of Sumidero\'s Canyon'];
var imageTitle = ['Playa Hermosa Ensenada', 'Knuckles Mountains Range', 'Sumidero\'s Canyon'];
var pathImage = ['https://images.unsplash.com/photo-1538964173425-93884d739596?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80', "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"];

class ProfileCardImageList extends StatelessWidget {

  late UserBloc userBloc;
  User user;

  ProfileCardImageList({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
        stream: userBloc.myPlacesListStream(user.uid!),
        //stream: userBloc.placesStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              print("none");

              return CircularProgressIndicator();

              break;
            case ConnectionState.waiting:
              print("waiting");

              return CircularProgressIndicator();
              break;
            case ConnectionState.active:
              print("active");

              return ListView(
                  children: userBloc.buildMyPlaces(snapshot.data.docs)
              );
              break;
            case ConnectionState.done:
              print("done");
              return ListView(
                children: userBloc.buildMyPlaces(snapshot.data.docs)
              );
              break;
            default:
              return ListView(
                  children: userBloc.buildMyPlaces(snapshot.data.docs)
              );
          }
        }

    );
  }

}

/**
 * ListView(
    children: <Widget>[
    ProfileCardImage(place),
    ProfileCardImage(place2),
    ProfileCardImage(place3),
    ],
    );
 */