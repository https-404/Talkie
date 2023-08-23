import 'package:cloud_firestore/cloud_firestore.dart';
//import '';

class DBService {
  static DBService instance = DBService();
  FirebaseFirestore? _db;

  DBService() {
    _db = FirebaseFirestore.instance;
  }

  static const String _userCollection = "Users";

  Future<void> createUserinFirestore(
      String _uid, String _name, String _email, String _imgUrl) async {
    try {
      return await _db?.collection(_userCollection).doc(_uid).set({
        "name": _name,
        "email": _email,
        "image": _imgUrl,
        "lastSeen": DateTime.now().toUtc(),
      });
    } catch (e) {
      print(e);
    }
  }
}
