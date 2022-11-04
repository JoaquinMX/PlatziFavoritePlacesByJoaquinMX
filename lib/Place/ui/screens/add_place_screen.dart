import 'dart:io';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/Place/ui/widgets/card_image.dart';
import 'package:untitled1/Place/ui/widgets/title_input_location.dart';
import 'package:untitled1/User/bloc/bloc_user.dart';
import 'package:untitled1/User/ui/widgets/text_input.dart';
import 'package:untitled1/User/ui/widgets/title_header.dart';
import 'package:untitled1/widgets/button_purple.dart';
import 'package:untitled1/widgets/gradient_back.dart';
import 'package:flutter/material.dart';
class AddPlaceScreen extends StatefulWidget {

  late File? image;

  AddPlaceScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  final _controllerLocationPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack('', 300),
          Row( // Personalized AppBar
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 25,
                  left: 5,
                ),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () {
                      /**
                       * Remove a Screen
                       */
                      Navigator.of(context).pop(context);
                      /**
                       * Add a screen
                       */
                      /*Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => SignInScreen()));*/
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                child: TitleHeader(title: "Add a new place"),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container( // Foto
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(0, pathImage: 'assets/img/mountain_stars.jpeg', width: MediaQuery.of(context).size.width * .95, height: 250, onPressedFabIcon: () {}, iconData: Icons.camera_alt),
                ),
                Container( // TextField Title
                  margin: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0),
                  child: TextInput(1, hintText: "Title", inputType: TextInputType.text, controller: _controllerTitlePlace),
                ),
                TextInput(4, hintText: 'Description', inputType: TextInputType.multiline, controller: _controllerDescriptionPlace),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(_controllerLocationPlace, iconData: Icons.location_on_outlined, hintText: 'AddLocation'),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(buttonText: "Add Place", onPressed: () {
                    //Firebase Storage upload
                    // get the url after uploaded
                    // Use of Cloud Firestore
                    // Insert all the object Place in Firestore.
                    userBloc.updatePlaceData(
                        Place(
                            name: _controllerTitlePlace.text,
                            description: _controllerDescriptionPlace.text,
                            likes: 0,
                            
                            urlImage: '')).whenComplete(() => {
                              print('termino'),
                              Navigator.pop(context)
                    });
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}