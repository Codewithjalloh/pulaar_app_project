import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  // Instance of FirebaseAuth to handle authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Getter to access the currently authenticated user
  User? get currentUser => _auth.currentUser;

  // Method to sign out the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Method to sign in a user with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      // Attempt to sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Return the authenticated user
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // If there is an error, return null
      return null;
    }
  }

  // Method to register a new user with email and password
  Future<User?> register(String email, String password) async {
    try {
      // Attempt to create a new user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Return the newly created user
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // If there is an error, return null
      return null;
    }
  }
}
