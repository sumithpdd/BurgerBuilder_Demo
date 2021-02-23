import 'package:burger_builder/models/dummy_data.dart';
import 'package:burger_builder/screens/burger.dart';
import 'package:burger_builder/widgets/app_drawer.dart';
import 'package:burger_builder/widgets/build_control.dart';
import 'package:burger_builder/widgets/build_controls.dart';
import 'package:burger_builder/widgets/burger_ingredient.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: Column(children: <Widget>[Burger(), BuildControls()]));
  }
}
