import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({Key? key,
    required this.iconData,
    required this.onPressed
}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}
class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
/*
  bool _isItFavorite = false;

  void onPressedFav() {
    setState(() {
      _isItFavorite = !this._isItFavorite;
    });
    if (_isItFavorite) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Agregado a tus Favoritos')
          ));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Se ha quitado de tus favoritos')
          ));
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      backgroundColor: Color(0XFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(
        widget.iconData
          /*this._isItFavorite ? Icons.favorite : Icons.favorite_border*/
      ),
      heroTag: null,
    );
  }

}