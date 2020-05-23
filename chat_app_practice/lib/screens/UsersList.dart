import 'package:chatapppractice/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Fetchdata.dart';

class UsersList extends StatefulWidget {
  static const routename = '/UsersList';

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  bool isloading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        isloading = true;
      });
      try {
        await Provider.of<FetchData>(context, listen: false).getusers();
        setState(() {
          isloading = false;
        });
      } catch (error) {
        setState(() {
          isloading = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FetchData>(context, listen: false);
    print(data.userlist);

    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text('️Users List'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, idx) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(ChatScreen.routename,arguments: {"recieveremail": data.userlist[idx]});
                  },
                  child: Container(
                    color: Colors.blueAccent.withOpacity(0.4),
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                      padding: EdgeInsets.all(8),
                      child: Row(
                    children: <Widget>[Text(data.userlist[idx],style: TextStyle(color: Colors.black),)],
                  )),
                );
              },
              itemCount: data.userlist.length,
            ),
    );
  }
}
