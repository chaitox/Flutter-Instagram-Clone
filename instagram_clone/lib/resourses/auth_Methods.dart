import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resourses/storege_metohods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String userName,
      required String bio,
      required Uint8List file}) async {
    String res = 'Some error';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //crear un usuario para logeo
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //antes de crear el usuario guardamos la imagen
        String url = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //agregar usuario a la base de datos
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': userName,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'file': url,
          'followers': [],
          'following': []
        });
        /*await _firestore.collection('users').add({
          'username': userName,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': []
        });*/
        res = 'ok';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //sign in
  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = 'Ocurrio algun error';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'ok';
      } else {
        res = 'Complete todos los campos';
      }
    } on FirebaseAuthException catch (err) {
      print(err.code);
      switch (err.code) {
        case 'user-no-found':
          res = 'Usuario no existe';
          break;
        case 'wrong-password':
          res = 'Usuario no existe';
          break;
        default:
          res = err.code.toString();
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
