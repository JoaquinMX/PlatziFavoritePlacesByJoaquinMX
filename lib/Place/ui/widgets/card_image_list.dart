import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/User/bloc/bloc_user.dart';
import '../../../User/model/user.dart';
import '../../model/place.dart';
import 'card_image.dart';

class CardImageList extends StatefulWidget {
  late User user;

  CardImageList({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
    return _CardImageList();
  }
}
late UserBloc userBloc;

class _CardImageList extends State<CardImageList> {

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
        height: 350,
        child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return CircularProgressIndicator();
                break;
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;
              case ConnectionState.active:
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs, widget.user));
                break;
              case ConnectionState.done:
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs, widget.user));
                break;
              default:
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs, widget.user));
                break;
            }
          },
        )
    );
}

  Widget listViewPlaces(List<Place> places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked!;
        userBloc.likePlace(place, widget.user.uid!);
        place.likes = place.liked! ? place.likes + 1 : place.likes - 1;
        userBloc.placeSelectedSink.add(place);
      });
    }

    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: places.map((place) {
          IconData iconDataLiked = Icons.favorite;
          IconData iconDataLike = Icons.favorite_border;
          return GestureDetector(
            onTap: () {
              print("Click place: ${place.name}");
              userBloc.placeSelectedSink.add(place);
            },
            child: CardImageWithFabIcon(
              20,
              pathImage: place.urlImage,
              width: 350,
              height: 250,
              onPressedFabIcon: () {
                setLiked(place);
              },
              iconData: place.liked != null ? place.liked! ? iconDataLiked : iconDataLike : iconDataLike,
            ),
          );
        }).toList(),
    );
  }
}