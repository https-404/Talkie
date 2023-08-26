import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

//here cloud Storage is firebase_storage
class CloudStorageService {

  FirebaseStorage? _storage;
  Reference? _reference;
  final String _profileImage = "profile_image";
  static CloudStorageService instance = CloudStorageService();

  CloudStorageService() {
    _storage= FirebaseStorage.instance;
    _reference= _storage?.ref();

  }
  Future<UploadTask?> uploadUserImage (String _uid, File _image) async {
    try {
       return  _reference?.child( _profileImage).child(_uid).putFile(_image);
    }
    catch(e)
    {
      print(e);
    }

  }

}