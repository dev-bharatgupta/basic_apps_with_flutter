import 'package:flutter/material.dart';
import 'package:meals_app/screens/filterscreen.dart';

class MainDrawer extends StatelessWidget {
  static const routename = "/maindrawer";

  Widget getlinks(String title, IconData icon, Function gotopage) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey,),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
      onTap: gotopage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        elevation: 12,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              color: Theme
                  .of(context)
                  .accentColor,
              child: Text(
                "Cooked up!!",
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 26),
              ),
            ),
            getlinks("meals", Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed("/");
            }),
            getlinks("filter", Icons.filter, () {
              Navigator.of(context).pushReplacementNamed(Filterscreen.routename);
            }),
          ],
        ),
      ),
    );
  }
}
