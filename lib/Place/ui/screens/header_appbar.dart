import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/User/bloc/bloc_user.dart';
import '../../../User/model/user.dart';
import '../widgets/card_image_list.dart';
import '../../../widgets/gradient_back.dart';
class HeaderAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc;
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {

            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              return showPlacesData(snapshot);
              break;
            case ConnectionState.done:
              return showPlacesData(snapshot);
              break;
            default:
              return showPlacesData(snapshot);
              break;
          }
        }
    );
  }
  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: [
          GradientBack('Bienvenido', 250.0),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL
      );

      return Stack(
        children: [
          GradientBack('Bienvenido', 250.0),
          CardImageList(user: user)
        ],
      );
    }
  }
}