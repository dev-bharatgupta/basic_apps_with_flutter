import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/Meals.dart';
import 'package:meals_app/screens/Categories_Screen.dart';
import 'package:meals_app/screens/Category_meal_screen.dart';
import 'package:meals_app/screens/FavouriteScreen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  List<Meal>favlist;
  TabScreen(this.favlist);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int indexofscreen = 0;
  List<Map<String, Object>> screenlist;
  @override
  initState()
  {
    screenlist=[
      {"screen": CategoriesScreen(),"title": "Categories"},
      {"screen" : FavouritesScreen(widget.favlist),"title": "myfavourites"},
    ];
    super.initState();
  }

  changescreen(int index) {
    setState(() {
       indexofscreen=index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          screenlist[indexofscreen]["title"],
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: screenlist[indexofscreen]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changescreen,
        selectedFontSize: 15,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: indexofscreen,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,

            ),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Category",),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text("favourites"),
          ),
        ],
      ),
    );
  }
}
