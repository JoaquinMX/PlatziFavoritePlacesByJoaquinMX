import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/User/model/user.dart';
import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
}