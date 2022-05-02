import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
class FirebaseApi {
  static UploadTask? uploadImage(String destination,File file)
  {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseStorage catch (e) {
      // TODO
      return null;
    }
    
  }
}

