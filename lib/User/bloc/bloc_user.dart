import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled1/Place/model/place.dart';
import 'package:untitled1/User/repository/auth_repository.dart';
import 'package:untitled1/User/repository/cloud_firestore_repository.dart';
import 'package:untitled1/User/model/user.dart' as Model;

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

  //4. Aniadir una imagen de un usuario
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  //5. signOut
  signOut() {
    _auth_repository.signOut();
  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}