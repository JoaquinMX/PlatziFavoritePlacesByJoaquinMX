import 'package:flutter/material.dart';
import 'package:untitled1/User/model/user.dart';

class Place {
  String? uid;
  String name;
  String description;
  String urlImage;
  int likes;
  bool? liked;
  final List<User>? usersLiked;
  //User? userOwner;

  Place({
    Key? key,
    required this.name,
    required this.description,
    required this.urlImage,
    //this.userOwner,
    required this.likes,
    this.liked,
    this.usersLiked,
    this.uid,
  });
}