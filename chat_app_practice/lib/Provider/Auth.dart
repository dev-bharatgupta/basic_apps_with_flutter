import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth extends ChangeNotifier {
  String email='test@test4.com';
  String password='';
  Future<void> registration(String email, String password) async {
    FirebaseAuth authobject = FirebaseAuth.instance;
    Firestore firestore=Firestore.instance;
    try {
      final response = await authobject.createUserWithEmailAndPassword(
          email: email, password: password);
      final user=await authobject.currentUser();
      this.email=email;

      final response1=firestore.collection('users').document(user.email).setData({});


    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    FirebaseAuth authobject = FirebaseAuth.instance;
    try {
      final response = await authobject.signInWithEmailAndPassword(
          email: email, password: password);
      this.email=email;
        // final user=await authobject.currentUser();

    } catch (error) {
      throw error;
    }
  }
}
