import 'package:firebas_serrie_coffee/models/user.dart';
import 'package:firebas_serrie_coffee/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userr? _userFromFirebaseUser(User? user) {
    return user != null ? Userr(uid: user.uid) : null;
  }

  Stream<Userr?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in anonymously
  Future<Userr?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      
      // Create document in 'brews' collection for anonymous user
      if (user != null) {
        await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      }
      
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email & password
  Future<Userr?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email & password - THIS IS THE ONE YOU NEED TO FIX
  Future<Userr?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      
      // This creates a document in 'brews' collection (since DatabaseService uses 'brews')
      await DatabaseService(uid: user!.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}