import 'package:burger_builder/helpers/app_constants.dart';
import 'package:burger_builder/models/user_order_model.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  OrderSummary({Key key, @required this.userOrderModel}) : super(key: key);
  final UserOrderModel userOrderModel;
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          children: <Widget>[
            Text(
              'Your Order',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              'A delicious burger with the following ingredients:',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: widget.userOrderModel.userIngredients.length,
                separatorBuilder: (_, __) => Divider(height: 0.5),
                itemBuilder: (BuildContext context, int index) {
                  var userIngredient =
                      widget.userOrderModel.userIngredients[index];
                  return ListTile(
                    leading: Icon(
                      Icons.check_circle_outline_outlined,
                      color: AppConstants.hexToColor(
                          AppConstants.APP_PRIMARY_COLOR),
                    ),
                    title: Text(
                      '${userIngredient.ingredient.label} (${userIngredient.ingredient.price.toStringAsFixed(2)})  X ${userIngredient.count}',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                    trailing: Text(
                      '${(userIngredient.ingredient.price * userIngredient.count).toStringAsFixed(2)} ',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  );
                },
              ),
            ),
            Text(
              'Total Price : \$' +
                  "${widget.userOrderModel.totalPrice.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Continue to Chekout?',
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: AppConstants.hexToColor(AppConstants.BUTTON_COLOR),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: AppConstants.hexToColor(
                    AppConstants.BUTTON_COLOR_CONTINUE,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
