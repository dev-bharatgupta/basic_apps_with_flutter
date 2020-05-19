import 'package:flutter/material.dart';
import 'package:meals_app/models/Meals.dart';
import '../widgets/Meals_list.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favlist;

  FavouritesScreen(this.favlist);
  @override
  Widget build(BuildContext context) {
    return
       favlist.isEmpty ? Container(
        child: Text("No item added in your favourite list"),):
      ListView.builder(
        itemBuilder: (context, index) {
          return MealsList(
            id: favlist[index].id,
            title: favlist[index].title,
            duration: favlist[index].duration,
            complexity: favlist[index].complexity,
            affordability: favlist[index].affordability,
            imageUrl: favlist[index].imageUrl,
          );
        },
        itemCount: favlist.length,
      );


  }
}
