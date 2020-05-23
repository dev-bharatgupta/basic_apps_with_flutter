import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../Provider/Auth.dart';
import '../Provider/Messages.dart';

class ChatScreen extends StatefulWidget {
  static const routename = '/Chatscreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  GlobalKey<FormState> chatformkey = GlobalKey<FormState>();
  String msz = '';
  bool isLoading = false;
  String docid = 'adfasffdsf';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        isLoading = true;
      });
      try {
        docid = await Provider.of<Messages>(context, listen: false)
            .getdocumentid(
                Provider.of<Auth>(context, listen: false).email,
                (ModalRoute.of(context).settings.arguments
                    as Map<String, String>)["recieveremail"]);
        setState(() {
          isLoading = false;
        });
      } catch (error) {
        setState(() {
          isLoading = false;
        });
        print(error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final routemap =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final recieveremail = routemap["recieveremail"];
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
//          IconButton(
//              icon: Icon(Icons.close),
//              onPressed: () {
//                print("Adfa");
//                Provider.of<Messages>(context, listen: false).recievedmsz(
//                    useremail: Provider.of<Auth>(context, listen: false).email,
//                    recieveremail: recieveremail);
//              }),
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection('Messages')
                            .document(docid)
                            .collection('Chat')
                            .orderBy("timestamp", descending: false)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          print(docid);
                          if (snapshot.hasError) {
                            print(snapshot.error);
                          }
                          if (snapshot.hasData) {
                            return SingleChildScrollView(
                              reverse: true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                    children: snapshot.data.documents.map((tx) {
                                  return Row(
                                    mainAxisAlignment:
                                        tx.data["By"] == recieveremail
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.end,
                                    children: <Widget>[
                                      tx.data["By"] == recieveremail
                                          ? CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors
                                                  .yellowAccent
                                                  .withOpacity(0.5),
                                            )
                                          : Container(),
                                      Card(
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              minWidth: 0),
                                          child: Text(
                                            tx.data["msz"],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          padding: EdgeInsets.all(4),
                                        ),
                                        color: tx.data["By"] != recieveremail
                                            ? Colors.blueAccent.withOpacity(0.5)
                                            : Colors.yellowAccent
                                                .withOpacity(0.5),
                                      ),
                                      tx.data["By"] != recieveremail
                                          ? CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.blueAccent
                                                  .withOpacity(0.5),
                                            )
                                          : Container(),
                                    ],
                                  );
                                }).toList()),
                              ),
                            );
                          }
                          return Container();
                        }),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        bottom: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Form(
                            key: chatformkey,
                            child: TextFormField(
                              onChanged: (value) {
                                msz = value;
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                hintText: 'Type your message here...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            if (msz != '')
                              Provider.of<Messages>(context, listen: false)
                                  .sendmsz(
                                      Provider.of<Auth>(context, listen: false)
                                          .email,
                                      recieveremail,
                                      msz,
                                      docid,
                                      DateTime.now());
                            chatformkey.currentState.reset();
                            msz = '';
                          },
                          child: Text(
                            'Send',
                            style: const TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
