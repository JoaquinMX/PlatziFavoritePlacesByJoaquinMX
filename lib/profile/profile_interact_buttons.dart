import 'package:flutter/material.dart';

class ProfileInteractButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileInteractButtons();
  }
}

class _ProfileInteractButtons extends State<ProfileInteractButtons> {

  bool isItSaved = false;

  void onPressedSaved() {
    setState(() {
      isItSaved = !isItSaved;
    });

    if (isItSaved) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Guardado')
          ));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Se ha quitado de tus elementos guardados')
          ));
    }
  }

  void onPressedOther() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Proximo a implementar')
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.white,
          mini: true,
          tooltip: "Save",
          onPressed: onPressedSaved,
          child: Icon(
          this.isItSaved ? Icons.save : Icons.save_outlined,
            color: Colors.deepPurple,
          ),
        ),
        FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 255, 255, .5),
          mini: true,
          tooltip: "TV",
          onPressed: onPressedOther,
          child: Icon(
            Icons.tv,
            color: Colors.deepPurple,


          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          tooltip: "Add",
          onPressed: onPressedOther,
          child: Icon(
            Icons.add,
            color: Colors.deepPurple,

          ),
        ),
        FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 255, 255, .5),
          mini: true,
          tooltip: "Mail",
          onPressed: onPressedOther,
          child: Icon(
              Icons.mail,
            color: Colors.deepPurple,
          ),
        ),
        FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 255, 255, .5),
          mini: true,
          tooltip: "person",
          onPressed: onPressedOther,
          child: Icon(
              Icons.person,
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }

}