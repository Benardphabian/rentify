import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUpUser({
    required String fullName,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      // Check if the user already exists in Firestore
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // User exists, update their roles list
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        List<String> roles = List<String>.from(userDoc['roles']);

        if (!roles.contains(role)) {
          roles.add(role);
          await _firestore.collection('users').doc(userDoc.id).update({'roles': roles});
        }

        return null; // Success
      } else {
        // New user, create Firebase Auth account
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Store user details in Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'fullName': fullName,
          'email': email,
          'roles': [role], // Store roles as a list
          'createdAt': FieldValue.serverTimestamp(),
        });

        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
