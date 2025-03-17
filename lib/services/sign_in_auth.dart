import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentify/screens/tenant_dashboard.dart';
import 'package:rentify/screens/landlord_dashboard.dart';

class SignInAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Authenticate user with Firebase Auth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch user data from Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();

      if (userDoc.exists) {
        List<String> roles = List<String>.from(userDoc['roles']);
        String fullName = (userDoc['fullName'] ?? '').trim(); // Fetch and clean full name
        String firstName = fullName.isNotEmpty ? fullName.split(" ")[0] : 'User'; // Extract first name

        // Debug: Check if first name extraction works
        print("Extracted first name: $firstName");

        // If multiple roles, prompt user to choose
        if (roles.length > 1) {
          _showRoleSelectionDialog(context, roles, firstName);
        } else {
          _navigateToDashboard(context, roles.first, firstName);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not found in database.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _showRoleSelectionDialog(BuildContext context, List<String> roles, String firstName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Role'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: roles.map((role) {
            return ListTile(
              title: Text(role),
              onTap: () {
                Navigator.pop(context); // Close dialog
                _navigateToDashboard(context, role, firstName);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _navigateToDashboard(BuildContext context, String role, String firstName) {
    if (role == 'Tenant') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TenantDashboard(firstName: firstName)),
      );
    } else if (role == 'Landlord') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandlordDashboard(firstName: firstName)),
      );
    }
  }
}
