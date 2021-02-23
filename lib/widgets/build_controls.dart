import 'package:burger_builder/helpers/app_constants.dart';
import 'package:burger_builder/models/dummy_data.dart';
import 'package:burger_builder/models/ingredients_model.dart';
import 'package:flutter/material.dart';

import 'build_control.dart';

class BuildControls extends StatefulWidget {
  BuildControls({Key key}) : super(key: key);

  @override
  _BuildControlsState createState() => _BuildControlsState();
}

class _BuildControlsState extends State<BuildControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.hexToColor("#CF8F2E"),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Current Price:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '\$20.40',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          buttonBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () {},
              child: const Text('ORDER NOW', style: TextStyle(fontSize: 20)),
              color: AppConstants.hexToColor("#DAD735"),
              textColor: AppConstants.hexToColor("#966909"),
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }

  get ingredientsControls {
    return dummyData.map<Widget>((data) {
      return Container(
        height: 50,
        child: Center(child: Text('Entry ${data.name}')),
      );
    }).toList();
  }

  Widget buttonBar() {
    return Column(
        children: dummyData.map<Widget>((ingredient) {
      return new BuildControl(
        title: ingredient.label,
        price: ingredient.price,
      );
    }).toList());
  }
}
