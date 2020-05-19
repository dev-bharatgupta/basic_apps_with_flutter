import 'package:flutter/material.dart';
import 'package:meals_app/data.dart';
import 'package:meals_app/models/Meals.dart';
import '../widgets/Category_list.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map(
              (catList) => CategoryList(
                title: catList.title,
                color: catList.color,
                id: catList.id,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      );

  }
}
