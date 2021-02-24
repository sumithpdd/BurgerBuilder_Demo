import 'package:burger_builder/models/dummy_data.dart';
import 'package:burger_builder/models/user_order_model.dart';
import 'package:burger_builder/screens/burger.dart';
import 'package:burger_builder/widgets/app_drawer.dart';
import 'package:burger_builder/widgets/build_controls.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  UserOrderModel userOrderModel = new UserOrderModel(
      customer: "sumith",
      userIngredients: new List<UserSelectedIngredientModel>(),
      totalPrice: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey, // assign key to Scaffold
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/burger-logo.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Burger Builder"))
            ],
          ),
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
          Burger(
            userOrderModel: userOrderModel,
          ),
          BuildControls(
              userOrderModel: userOrderModel,
              addHandler: addIngredientHandler,
              removeHandler: removeIngredientHandler)
        ]));
  }

  addIngredientHandler(String name) {
    var ingredient = dummyData.singleWhere((ing) => ing.name == name);
    setState(() {
      var foundIngredient = userOrderModel.userIngredients.singleWhere(
          (element) => element.ingredient.name == name, orElse: () {
        return null;
      });
      if (foundIngredient == null) {
        userOrderModel.userIngredients.add(
            new UserSelectedIngredientModel(ingredient: ingredient, count: 1));
      } else {
        foundIngredient.count++;
      }

      userOrderModel.totalPrice = userOrderModel.totalPrice + ingredient.price;
    });
  }

  removeIngredientHandler(name) {
    var ingredient = dummyData.singleWhere((ing) => ing.name == name);
    setState(() {
      var foundIngredient = userOrderModel.userIngredients.singleWhere(
          (element) => element.ingredient.name == name, orElse: () {
        return null;
      });

      if (foundIngredient == null) {
        userOrderModel.userIngredients.add(
            new UserSelectedIngredientModel(ingredient: ingredient, count: 1));
      } else {
        foundIngredient.count--;
      }

      userOrderModel.totalPrice = userOrderModel.totalPrice - ingredient.price;
    });
  }
}
