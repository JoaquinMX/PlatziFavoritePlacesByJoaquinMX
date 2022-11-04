import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/User/bloc/bloc_user.dart';
import 'package:untitled1/User/model/user.dart';
import 'package:untitled1/widgets/user_info.dart';

class ProfileBasicInfo extends StatelessWidget {

  late UserBloc userBloc;
  late User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
            case ConnectionState.none:
              return CircularProgressIndicator();
              break;
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;
            case ConnectionState.active:
              return showProfileData(snapshot);
              break;
            case ConnectionState.done:
              return showProfileData(snapshot);
              break;
          }
        }
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("Not logged");

      return Container(
        margin: EdgeInsets.only(
            top: 25,
            left: 10
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("The data could not been loaded. Please re-try log-in")
          ],
        ),
      );
    }
    else {
      print('Logged');
      print(snapshot.data);
      user = User(
          name: snapshot.data.displayName != null ? snapshot.data.displayName : "John Doe",
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL != null ? snapshot.data.photoURL : "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          key: key
      );
      return UserInfo(user);

    }
  }
}