import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/User/bloc/bloc_user.dart';
import 'package:untitled1/User/model/user.dart' as Model;
import 'package:untitled1/platzi_trips_cupertino.dart';
import 'package:untitled1/widgets/button_green.dart';
import 'package:untitled1/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen> {
  late double widthScreen;
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    widthScreen = MediaQuery.of(context).size.width;
    return Container(
      child: _handleCurrentSession()
    );
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // Snapshot contiene la informacion -> data -> Object User
          if(!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUI();
          }
          else {
            return PlatziTripsCupertino();
          }
        }
    );
  }

  Widget signInGoogleUI() {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Container(
               width: widthScreen - (widthScreen / 14),
               child:  FittedBox(
                 fit: BoxFit.contain,
                 child: Text(
                   "Welcome \n This is your Travel App",
                   style: TextStyle(
                       fontSize: 36,
                       fontFamily: "Lato",
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),
                 ),
               ),
             ),
              /*ButtonGreen(text: 'Login with Email', onPressed: () {
                userBloc.signInEmail("joaquinmx@joaquinmx.com", "joaquinmx.com").then((UserCredential user) => print("El usuario es ${user.user?.displayName}"));
              }, height: 50, width: 300),
              */
              ButtonGreen(text: 'Login with Gmail', onPressed: () {
                userBloc.signInGoogle().then((UserCredential user) => {
                  userBloc.updateUserData(Model.User(uid: user.user!.uid, name: user.user!.displayName!, email: user.user!.email!, photoURL: user.user!.photoURL!))
                });
              }, height: 50, width: 300)
            ],
          )
        ],
      ),
    );
  }
}