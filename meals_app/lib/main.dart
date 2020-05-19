import 'package:flutter/material.dart';
import 'package:meals_app/models/Meals.dart';
import 'package:meals_app/screens/Category_meal_screen.dart';
import 'package:meals_app/screens/Recipie_screen.dart';
import 'package:meals_app/screens/Tab_screen.dart';
import 'package:meals_app/screens/filterscreen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import './data.dart';
import 'widgets/Category_list.dart';
import 'screens/Categories_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filterdmeal = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> currlist = DUMMY_MEALS;
  List<Meal> favlist=[];

  void getfilteredscreen(Map<String, bool> filterdmeal) {
    setState(() {
      this.filterdmeal = filterdmeal;
      currlist = DUMMY_MEALS.where((meal) {
        if (filterdmeal["gluten"] && !meal.isGlutenFree) return false;
        if (filterdmeal["lactose"] && !meal.isLactoseFree) return false;
        if (filterdmeal["vegan"] && !meal.isVegan) return false;
        if (filterdmeal["vegetarian"] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void togglefav(String id) {
    int curridx = favlist.indexWhere((meal) => meal.id == id);
    if (curridx >= 0) {
      setState(() {
        favlist.removeAt(curridx);
      });
    } else {
      setState(() {
        favlist.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == id),
        );
      });
    }
  }
  bool isfav(String id)
  {
    int curridx = favlist.indexWhere((meal) => meal.id == id);
    if(curridx>=0)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) {
          return SafeArea(child: TabScreen(favlist));
        },
        CategoryMeal.catmeal: (context) {
          return CategoryMeal(currlist);
        },
        RecipieScreen.routename: (context) {
          return RecipieScreen(togglefav,isfav);
        },
        Filterscreen.routename: (context) {
          return Filterscreen(getfilteredscreen, filterdmeal);
        },
      },
      //home: SafeArea(child: TabScreen()),
      title: "MealsApp",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 249, 215, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromARGB(20, 51, 51, 1),
            ),
            title: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed")),
      ),
    );
  }
}
