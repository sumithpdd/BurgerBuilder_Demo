import 'package:burger_builder/helpers/app_constants.dart';
import 'package:burger_builder/models/dummy_data.dart';
import 'package:burger_builder/models/user_order_model.dart';
import 'package:burger_builder/screens/order_summary.dart';
import 'package:flutter/material.dart';

import 'build_control.dart';

class BuildControls extends StatefulWidget {
  final UserOrderModel userOrderModel;
  final Function addHandler;
  final Function removeHandler;

  const BuildControls({
    Key key,
    this.userOrderModel,
    this.addHandler,
    this.removeHandler,
  }) : super(key: key);

  @override
  _BuildControlsState createState() => _BuildControlsState();
}

class _BuildControlsState extends State<BuildControls> {
  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.userOrderModel.totalPrice;
    return Container(
      color:
          AppConstants.hexToColor(AppConstants.BUILD_CONTROLS_CONTAINER_COLOR),
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
                  '\$${totalPrice.toStringAsFixed(2)}',
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
              onPressed: totalPrice <= 0
                  ? null
                  : () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: OrderSummary(
                            userOrderModel: widget.userOrderModel,
                          ),
                        ),
                      );
                    },
              child: const Text('ORDER NOW', style: TextStyle(fontSize: 20)),
              color:
                  AppConstants.hexToColor(AppConstants.BUTTON_BACKGROUND_COLOR),
              textColor:
                  AppConstants.hexToColor(AppConstants.BUTTON_TEXT_COLOR),
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }

  Widget buttonBar() {
    final userIngredients = widget?.userOrderModel?.userIngredients;
    return Column(
      children: dummyData.map<Widget>((ingredient) {
        var currentCount = 0;

        final userIngredient = userIngredients?.singleWhere(
          (ing) => ing.ingredient.name == ingredient.name,
          orElse: () => null,
        );
        currentCount = userIngredient?.count ?? 0;

        return BuildControl(
          ingredient: ingredient,
          currentValue: currentCount,
          addHandler: widget.addHandler,
          removeHandler: widget.removeHandler,
        );
      }).toList(),
    );
  }
}
