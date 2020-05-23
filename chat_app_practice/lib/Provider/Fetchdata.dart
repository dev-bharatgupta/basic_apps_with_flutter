import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData extends ChangeNotifier {
  List<String> _userslist = [];

  List<String> get userlist {
    return _userslist;
  }

  Future<void> getusers() async {
    FirebaseAuth auth=FirebaseAuth.instance;
    final user= await auth.currentUser();
   try{
     Firestore firestore = Firestore.instance;
     final response = await firestore.collection('users').getDocuments();
     response.documents.forEach((tx) async {
     if(tx.documentID!= user.email)
       {

         if(!_userslist.contains(tx.documentID))
           {
       _userslist.add(tx.documentID);
       print(_userslist);

           }
       }
     });
   } catch(error)
    {
      print(error);
    }

  }
}
