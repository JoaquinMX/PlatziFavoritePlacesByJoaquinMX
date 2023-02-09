import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/Place/ui/screens/add_place_screen.dart';
import 'package:untitled1/widgets/Circle_button.dart';
import '../../bloc/bloc_user.dart';



class ProfileInteractButtons extends StatelessWidget {
  late UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Cambiar Contraseña
        CircleButton(Colors.white, Colors.deepPurple, Icons.vpn_key, null, true, () { }, 'Change Password'),
        // Aniadir un nuevo lugar
        CircleButton(Colors.white, Colors.deepPurple, Icons.add, null, false, () {
          pickImage(context);
          /*
          ImagePicker().pickImage(source: ImageSource.camera)
              .then((image) {
                if(image != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(image.path)), fullscreenDialog: true));
                }
          })
              .catchError((onError) => print(onError));
          */
        }, 'add'),
        //Cerrar sesion
        CircleButton(Colors.white, Colors.deepPurple, Icons.exit_to_app, null, true, () => {userBloc.signOut()}, 'Sign Out')
      ],
    );
  }

  pickImage(BuildContext context) async {
    final navigator = Navigator.of(context);
    XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      await navigator.push(
          MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(pickedImage.path)))
      );
    }
  }
}

/*
class ProfileInteractButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileInteractButtons();
  }
}

class _ProfileInteractButtons extends State<ProfileInteractButtons> {
  late UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Cambiar Contraseña
        CircleButton(Colors.white, Colors.deepPurple, Icons.vpn_key, null, true, () { }, 'Change Password'),
        // Aniadir un nuevo lugar
        CircleButton(Colors.white, Colors.deepPurple, Icons.add, null, false, () {
          ImagePicker().pickImage(source: ImageSource.camera)
              .then((image) {
              //Navigator.push(context,
                //  MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(image.path))));
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(image!.path))));
          })
              .catchError((onError) => print(onError));
        }, 'add'),
        //Cerrar sesion
        CircleButton(Colors.white, Colors.deepPurple, Icons.exit_to_app, null, true, () => {userBloc.signOut()}, 'Sign Out')
      ],
    );
  }
}
*/