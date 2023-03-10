import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppSession {}

//agar tidak global masukkan ke class dan tambahkan static
get currentUser {
  return FirebaseAuth.instance.currentUser;
}

DocumentReference get userCollection {
  return FirebaseFirestore.instance.collection("users").doc(currentUser.uid);
}
