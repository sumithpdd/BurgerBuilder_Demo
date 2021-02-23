import 'package:burger_builder/models/dummy_data.dart';
import 'package:burger_builder/widgets/app_drawer.dart';
import 'package:burger_builder/widgets/build_control.dart';
import 'package:burger_builder/widgets/burger_ingredient.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> ingredientsList = new List<Widget>();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey, // assign key to Scaffold
        appBar: AppBar(
          title: Text("Burger Builder"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            },
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},
            ),
          ],
        ),
        drawer: AppDrawer(),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    BurgerIngredient(type: "bread-top"),
                    new ListView(
                      shrinkWrap: true,
                      children: transformedIngredients,
                    ),
                    BurgerIngredient(type: "bread-bottom"),
                    BuildControls()
                  ],
                ),
              ),
            ),
          )
        ]));
  }

  get transformedIngredients {
    for (var ingredient in dummyDataIngredients) {
      ingredientsList.add(BurgerIngredient(type: ingredient));
    }
    return ingredientsList;
  }
}
