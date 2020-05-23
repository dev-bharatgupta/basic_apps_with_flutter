import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : ListView.builder(
                 physics: PageScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: greatPlaces.items.length,
                        itemBuilder: (ctx, i) => Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                              child: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[i].image),
                                radius: 200,
                              ),
                            ),
                            Container(
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(greatPlaces.items[i].title)),
                              height: 50,
                              width: 200,
                            )
                          ],
                        ),

                      ),
              ),
      ),
    );
  }
}
