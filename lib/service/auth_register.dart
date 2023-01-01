import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> servisler() {
    return _firestore.collection('servislerim').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> projeler() {
    return _firestore.collection('projelerim').get();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleSignIn?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // await _firestore.collection("Person").doc(_auth.currentUser!.uid).set({'userName': googl, 'email': email, "password": password});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  signOutWithGoogle() async {
    return GoogleSignIn().signOut();
  }

  User? issignin() {
    return _auth.currentUser;
  }

  infouser() {
    return _auth.currentUser?.uid;
  }

  Future<User?> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set({'userName': name, 'email': email, "password": password});

    return user.user;
  }
}
