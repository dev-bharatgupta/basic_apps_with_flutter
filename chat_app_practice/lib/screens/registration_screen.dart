import 'package:chatapppractice/screens/UsersList.dart';
import 'package:chatapppractice/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Auth.dart';
import 'welcome_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const routename = '/Registration screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';
  FocusNode passfocus = FocusNode();
  GlobalKey<FormState> registerform = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Builder(builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: registerform,
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
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),

//
                  ),
                  textInputAction: TextInputAction.next,
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
                    if (value.length < 6)
                      return "password must contains atleast 6 alphabets";
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
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
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        final valid = registerform.currentState.validate();

                        if (valid) registerform.currentState.save();
                        {
                          setState(() {
                            isloading = true;
                          });
                          try {
                            print([email, password]);
                            await Provider.of<Auth>(context, listen: false)
                                .registration(email, password);

                            setState(() {
                              isloading = false;
                            });
                            FocusScope.of(context).unfocus();
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil(UsersList.routename,ModalRoute.withName(WelcomeScreen.routename));
                          } catch (error) {
                            setState(() {
                              isloading = false;
                            });
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Unable to register",
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
                      child: isloading
                          ? CircularProgressIndicator(backgroundColor: Colors.white,)
                          : Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
