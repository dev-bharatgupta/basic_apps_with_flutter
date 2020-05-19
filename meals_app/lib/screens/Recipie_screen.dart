import 'package:flutter/material.dart';
import '../data.dart';

class RecipieScreen extends StatelessWidget {
  static const routename = "/recipiescreen";
  Function isfav;
  Function togglefav;

  RecipieScreen(this.togglefav, this.isfav);

  Widget buildcontainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 150,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routedid = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((tx) => tx.id == routedid);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            meal.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildcontainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: Text(meal.ingredients[index]),
                  ),
                  itemCount: meal.ingredients.length,
                ),
              ),
              buildcontainer(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            radius: 15,
                            child: Text(
                              (index + 1).toString(),
                            ),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isfav(routedid) ? Icons.star : Icons.star_border,
          ),
          onPressed: ()=>togglefav(routedid),
        ),
      ),
    );
  }
}
