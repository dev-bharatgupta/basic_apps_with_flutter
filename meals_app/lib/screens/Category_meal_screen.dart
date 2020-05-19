import 'package:flutter/material.dart';
import 'package:meals_app/models/Meals.dart';
import 'package:meals_app/widgets/Meals_list.dart';
import '../data.dart';

class CategoryMeal extends StatelessWidget {
//  final String title;
//  final String id;
//  CategoryMeal({this.title,this.id});
  static const catmeal = "/category-meal";
  List<Meal>currlist;
  CategoryMeal(this.currlist);

  @override
  Widget build(BuildContext context) {
    final routergs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routergs["title"];
    final id = routergs["id"];
    final filteredmeal = currlist.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealsList(
              id: filteredmeal[index].id,
              title: filteredmeal[index].title,
              duration: filteredmeal[index].duration,
              complexity: filteredmeal[index].complexity,
              affordability: filteredmeal[index].affordability,
              imageUrl: filteredmeal[index].imageUrl,
            );
          },
          itemCount: filteredmeal.length,
        ),
      ),
    );
  }
}
