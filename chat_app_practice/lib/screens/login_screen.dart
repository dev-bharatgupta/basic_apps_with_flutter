import 'package:chatapppractice/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_screen.dart';
import '../Provider/Auth.dart';
import 'UsersList.dart';

class LoginScreen extends StatefulWidget {
  static const routename='/loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  FocusNode passfocus = FocusNode();
  GlobalKey<FormState> loginform = GlobalKey<FormState>();
  bool isloading = false;


  @override
  void initState()  {

 Future.delayed(Duration.zero).then((_) async {
   final user =await FirebaseAuth.instance.currentUser();
   print(user.email);
 });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(

        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: loginform,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  TextFormField(

                    onFieldSubmitted: (value) {
                      email = value;
                      FocusScope.of(context).requestFocus(passfocus);
                    },
                    onSaved: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) return "emailid can not be empty";

                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(

                      hintText: 'Enter your email',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    onFieldSubmitted: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) return "password can not be empty";
                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password.',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),

                    ),
                    focusNode: passfocus,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          final valid = loginform.currentState.validate();

                          if (valid) loginform.currentState.save();
                          {
                            setState(() {
                              isloading = true;
                            });
                            try {
                              print([email, password]);
                              await Provider.of<Auth>(context, listen: false)
                                  .login(email, password);
                              FocusScope.of(context).unfocus();
                              Navigator.of(context)
                                  .pushNamedAndRemoveUntil(UsersList.routename,ModalRoute.withName(WelcomeScreen.routename));
                              if(mounted)
                              setState(() {
                                isloading = false;
                              });


                            } catch (error) {
                              setState(() {
                                isloading = false;
                              });
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    error.toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                ),
                              );
                            }
                          }
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: isloading? CircularProgressIndicator(backgroundColor: Colors.white,):Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
