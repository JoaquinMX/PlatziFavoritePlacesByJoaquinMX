import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/User/model/user.dart' as userModel;

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
    'myPlaces': user.myPlaces,
    'myFavoritePlaces' : user.myFavoritePlaces,
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
      'userOwner' : _userRef//"${USERS}/${user!.uid}"
    });
  }
}