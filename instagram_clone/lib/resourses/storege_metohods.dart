import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //add image to firebasestorage
  Future<String> uploadImageToStorage(
      String childname, Uint8List file, bool isPost) async {
    Reference ref =
        _firebaseStorage.ref().child(childname).child(_auth.currentUser!.uid);

    UploadTask task = ref.putData(file);

    TaskSnapshot snapshot = await task;

    String url = await snapshot.ref.getDownloadURL();

    return url;
  }
}
