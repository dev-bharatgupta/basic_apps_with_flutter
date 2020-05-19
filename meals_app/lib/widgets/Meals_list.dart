import 'package:flutter/material.dart';
import 'package:meals_app/screens/Recipie_screen.dart';
import '../models/Meals.dart';

class MealsList extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealsList(
      {@required this.id,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.imageUrl});

  String get complex {
    if (this.complexity == Complexity.Simple) return "Simple";
    if (this.complexity == Complexity.Challenging) return "Challenging";
    if (this.complexity == Complexity.Hard) return "Hard";
  }

  String get afford {
    if (this.affordability == Affordability.Affordable) return "Affordable";
    if (this.affordability == Affordability.Luxurious) return "Luxurious";
    if (this.affordability == Affordability.Pricey) return "Pricey";
  }

  void gotorecipiescreen(BuildContext context) {
    Navigator.of(context).pushNamed(RecipieScreen.routename, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>gotorecipiescreen(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 3,
                  child: Container(
                    color: Colors.black54,
                    width: 210,
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      SizedBox(
                        width: 4,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 4,
                        ),
                        Text(complex),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          afford,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
