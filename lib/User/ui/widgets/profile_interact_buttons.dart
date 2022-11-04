import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/widgets/Circle_button.dart';
import '../../../Place/ui/screens/add_place_screen.dart';
import '../../bloc/bloc_user.dart';

class ProfileInteractButtons extends StatelessWidget {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Cambiar Contraseña
        CircleButton(Colors.white, Colors.deepPurple, Icons.vpn_key, null, true, () { }, 'Change Password'),
        // Aniadir un nuevo lugar
        CircleButton(Colors.white, Colors.deepPurple, Icons.add, null, false, () {
          File? image;
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image)));
        }, 'add'),
        //Cerrar sesion
        CircleButton(Colors.white, Colors.deepPurple, Icons.exit_to_app, null, true, () => {userBloc.signOut()}, 'Sign Out')
      ],
    );
  }
}