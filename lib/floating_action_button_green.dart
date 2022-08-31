import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }
}
class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

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

  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      backgroundColor: Color(0XFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
          this._isItFavorite ? Icons.favorite : Icons.favorite_border
      ),
    );
  }

}