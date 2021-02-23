import 'package:burger_builder/models/dummy_data.dart';
import 'package:burger_builder/widgets/burger_ingredient.dart';
import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  Burger({Key key}) : super(key: key);

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  List<Widget> ingredientsList = new List<Widget>();
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
    for (var ingredient in dummyData) {
      ingredientsList.add(BurgerIngredient(type: ingredient.name));
    }
    return ingredientsList;
  }
}
