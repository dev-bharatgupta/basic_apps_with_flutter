import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends ChangeNotifier {

  Future<String> getdocumentid(String useremail, String recieveremail) async
  {
    try {
      var doc =
      await Firestore.instance.collection('Messages').where(
          "members", whereIn: [
        [useremail, recieveremail],
        [recieveremail, useremail]
      ]).getDocuments();
      if (doc.documents.length == 0) {
        await Firestore.instance.collection('Messages').document().setData(
           { "members": [useremail, recieveremail]});
        doc =
        await Firestore.instance.collection('Messages').where(
            "members", whereIn: [
          [useremail, recieveremail],
          [recieveremail, useremail]
        ]).getDocuments();
      }
      return doc.documents[0].documentID;
    } catch (error) {
      throw error;
    }
  }


  Future<void> sendmsz(String useremail, String recieveremail,
      String msz,String docid,DateTime date) async {
    try {
      await Firestore.instance
          .collection('Messages')
          .document(docid)
          .collection('Chat')
          .document()
          .setData({"By": useremail, "msz": msz,"timestamp":date});
    } catch (error) {
      throw error;
    }
  }

// \


}
