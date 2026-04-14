import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebas_serrie_coffee/models/brew.dart';
import 'package:firebas_serrie_coffee/models/user.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('brews'); // we create a collection named users in firestore (even if it does not exist yet firebase will create it for us)

  Future updateUserData(String sugars, String name, int strength) async {
    return await usersCollection.doc(uid).set({ // doc() creates a new document with a unique id and if it exists it overwrites it
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Brew(
        name: doc.get('name') ?? '',
        sugars: doc.get('sugars') ?? '0',
        strength: doc.get('strength') ?? 0
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return usersCollection.snapshots().map(_brewListFromSnapshot);
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid!,
      name: snapshot.get('name'),
      sugars: snapshot.get('sugars'),
      strength: snapshot.get('strength'),
    );
  }
  // get user doc stream
  Stream<UserData> get userData {
    return usersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }


}