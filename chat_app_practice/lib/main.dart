import 'package:chatapppractice/Provider/Fetchdata.dart';
import 'package:chatapppractice/Provider/Messages.dart';
import 'package:chatapppractice/screens/UsersList.dart';
import 'package:flutter/material.dart';
import 'package:chatapppractice/screens/welcome_screen.dart';
import 'package:chatapppractice/screens/login_screen.dart';
import 'package:chatapppractice/screens/registration_screen.dart';
import 'package:chatapppractice/screens/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:chatapppractice/Provider/Auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: FetchData(),
        ),
        ChangeNotifierProvider.value(value: Messages()),
      ],
      child: MaterialApp(
//      initialRoute: LoginScreen.routename,
        routes: {
          UsersList.routename: (context) => UsersList(),
          LoginScreen.routename: (context) => LoginScreen(),
          ChatScreen.routename: (context) => ChatScreen(),
          RegistrationScreen.routename: (context) => RegistrationScreen(),
          WelcomeScreen.routename: (context) => WelcomeScreen()
        },

        home: WelcomeScreen(),
      ),
    );
  }
}
