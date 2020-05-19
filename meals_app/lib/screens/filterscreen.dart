import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Filterscreen extends StatefulWidget {
  static const routename = "/filterscreen";
  Function getfiltereditem;
  Map<String, bool> currmap;

  Filterscreen(this.getfiltereditem, this.currmap);

  @override
  _FilterscreenState createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {


  bool glutenfree = false;

  bool vegetarian = false;

  bool vegan = false;

  bool lactosefree = false;


  Widget buildfilterd(String title, String desc, bool currenval, Function f1) {
    return SwitchListTile(
      title: Text(title),
      value: currenval,
      subtitle: Text(desc),
      onChanged: f1,
    );
  }

  @override
  initState() {
    this.glutenfree = widget.currmap["gluten"];
    this.vegetarian = widget.currmap["vegetarian"];
    this.vegan = widget.currmap["vegan"];
    this.lactosefree = widget.currmap["lactose"];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text("Filter"),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.save,
                ),
                onPressed: (){
                  final filterditem=
                  {
                    "gluten" : glutenfree,
                    "lactose" :lactosefree,
                    "vegetarian":vegetarian,
                    "vegan": vegan,
                  };
                  return widget.getfiltereditem(
                        filterditem
                  );
                },
              ),

            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Adjust ur meal",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    buildfilterd(
                      "glutenfree",
                      "is gluten free",
                      glutenfree,
                      (newval) {
                        setState(() {
                          glutenfree = newval;
                        });
                      },
                    ),
                    buildfilterd(
                      "vegetarian",
                      "include vegies",
                      vegetarian,
                      (newval) {
                        setState(() {
                          vegetarian = newval;
                        });
                      },
                    ),
                    buildfilterd(
                      "lactose fee",
                      "no cheese and dairy products included",
                      lactosefree,
                      (newval) {
                        setState(() {
                          lactosefree = newval;
                        });
                      },
                    ),
                    buildfilterd(
                      "vegan",
                      "no meat",
                      vegan,
                      (newval) {
                        setState(() {
                          vegan = newval;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
