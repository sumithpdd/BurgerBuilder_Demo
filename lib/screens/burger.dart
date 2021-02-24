import 'package:burger_builder/models/dummy_data.dart';
import 'package:burger_builder/models/user_order_model.dart';
import 'package:burger_builder/widgets/burger_ingredient.dart';
import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  Burger({Key key, this.userOrderModel}) : super(key: key);
  final UserOrderModel userOrderModel;
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  get transformedIngredients {
    List<Widget> ingredientsList = new List<Widget>();
    if (widget.userOrderModel.userIngredients == null ||
        widget.userOrderModel.userIngredients.length == 0) {
      ingredientsList.add(Container(
          child: Center(
              child: Text(
        "Please start adding ingredients!",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ))));
    }
    for (var selectedIngredient in widget.userOrderModel.userIngredients) {
      for (var i = 0; i < selectedIngredient.count; i++) {
        ingredientsList
            .add(BurgerIngredient(type: selectedIngredient.ingredient.name));
      }
    }
    return ingredientsList;
  }
}
