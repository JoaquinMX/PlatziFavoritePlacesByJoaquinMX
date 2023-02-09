import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/User/model/user.dart' as userModel;

import '../../Place/ui/widgets/card_image.dart';
import '../ui/widgets/profile_card_image.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(userModel.User user) async {
    /*_db.collection(USERS).add(theUser).then((DocumentReference doc) =>
        print('Document Snapshot added with id: ${doc.id}'));*/
    DocumentReference ref = _db.collection(USERS).doc(user.uid);

    return ref.set({
    'uid': user.uid,
    'name': user.name,
    'email': user.email,
    'photoURL': user.photoURL,
    'lastSignIn' : DateTime.now(),
    }, SetOptions(merge: true)).onError((e, _) => print("Error writing document: $e"));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    User? user = _auth.currentUser;
    DocumentReference _userRef = _db.collection(this.USERS).doc(user?.uid);
    await refPlaces.add({

      'name' : place.name,
      'description' : place.description,
      'likes': place.likes,
      'userOwner' : _db.doc("$USERS/${user!.uid}"),//_userRef,//"${USERS}/${user!.uid}",
      'urlImage': place.urlImage,
      'usersLiked': place.usersLiked
    }).then((DocumentReference dr) {
      dr. get().then((DocumentSnapshot snapshot) {

        DocumentReference refUsers = _db.collection(USERS).doc(user.uid);
        refUsers.update({
          'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")])
        });

      });
    });
  }

  List<ProfileCardImage> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfileCardImage> profilePlaces = <ProfileCardImage>[];
    
    for (var place in placesListSnapshot) {
      profilePlaces.add(ProfileCardImage(
        place: Place(name: place['name'], description: place['description'], urlImage: place['urlImage'], likes: place['likes'])
      ));
    }
    return profilePlaces;
  }

    List<Place> buildPlaces(List placesListSnapshot, userModel.User user) {
      List<Place> places = [];

      for (var p in placesListSnapshot) {
        Place place = Place(uid: p.id, name: p['name'], description: p['description'],
            urlImage: p['urlImage'],likes: p['likes']
        );
        List usersLikedRefs =  p['usersLiked'];
        place.liked = false;
        for (var drUL in usersLikedRefs) {
          if(user.uid == drUL.id){
            place.liked = true;
          }
        }
        places.add(place);
      }
      return places;
  }

  Future likePlace(Place place, String uid) async {
    await _db.collection(PLACES).doc(place.uid).get()
        .then((DocumentSnapshot ds) {
          int likes = ds["likes"];
          _db.collection(PLACES).doc(place.uid)
              .update({
            'likes': place.liked != null ? place.liked! ? likes + 1 : likes - 1 : 1,
            'usersLiked':
                place.liked != null ? place.liked!
                    ?
                    FieldValue.arrayUnion([_db.doc("$USERS/$uid")])
                    :
                    FieldValue.arrayRemove([_db.doc("$USERS/$uid")])
                :
                FieldValue.arrayUnion([_db.doc("$USERS/$uid")])

          });
    });
  }
}