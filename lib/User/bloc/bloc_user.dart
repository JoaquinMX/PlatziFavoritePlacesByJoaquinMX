import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/Place/repository/fierbase_storage_repository.dart';
import 'package:untitled1/User/repository/auth_repository.dart';
import 'package:untitled1/User/repository/cloud_firestore_api.dart';
import 'package:untitled1/User/repository/cloud_firestore_repository.dart';
import 'package:untitled1/User/model/user.dart' as Model;

import '../../Place/ui/widgets/card_image.dart';
import '../ui/widgets/profile_card_image.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  /**
   * Flujo de datos = Streams
   * Stream - Firebase
   * Ambos poseen el mismo tipo de datos (Firebase - dart)
   * Para otras bases de datos se necesitaría hacer uso de la clase StreamController para
   * controlar el flujo de datos de manera adecuada
   */

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User?> get currentUser async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
  //Casos de uso:

  //1. SignIn a la aplicacion con Google
  Future<UserCredential> signInGoogle() {
    return _auth_repository.signInGoogle();
  }

  //2. SignIn a la aplicacion con Email
  Future<UserCredential> signInEmail(String email, String password) {
    return _auth_repository.signInEmail(email, password);
  }

  //3. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(Model.User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
  //6. Get all places
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, Model.User user) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);
  //8. Like places;
  Future likePlace(Place place, String uid) => _cloudFirestoreRepository.likePlace(place, uid);
  //7.- Gets the places of the user UID provided.
  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES)
      .where("userOwner", isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().USERS}/$uid"))
      .snapshots();
  List<ProfileCardImage> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  //4. Aniadir una imagen de un usuario
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  //5. signOut
  signOut() {
    _auth_repository.signOut();
  }

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image)
    => _firebaseStorageRepository.uploadFile(path, image);


  @override
  void dispose() {
    // TODO: implement dispose
  }

}