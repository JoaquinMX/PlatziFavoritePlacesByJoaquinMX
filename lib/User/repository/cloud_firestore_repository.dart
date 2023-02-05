import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/User/model/user.dart' as Model;
import 'package:firebase_auth/firebase_auth.dart';
import '../../Place/ui/widgets/card_image.dart';
import '../ui/widgets/profile_card_image.dart';
import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(Model.User user) => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
  List<ProfileCardImage> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, Model.User user) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String uid) => _cloudFirestoreAPI.likePlace(place, uid);
}