import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/Category_meal_screen.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryList({this.title, this.color, this.id});

  void gotocategorymealpage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMeal.catmeal,
      arguments: {"title": title, "id": id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gotocategorymealpage(context),
      borderRadius: BorderRadius.circular(8),
      splashColor: Theme.of(context).primaryColor,

      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
