import 'package:flutter/material.dart';

import 'custom_stepper.dart';

class BuildControl extends StatefulWidget {
  BuildControl({Key key, this.title, this.price}) : super(key: key);
  final String title;
  final double price;
  @override
  _BuildControlState createState() => _BuildControlState();
}

class _BuildControlState extends State<BuildControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "(\$" + "${widget.price})",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CustomStepper(
                  value: 1,
                  upperLimit: 5,
                  lowerLimit: 0,
                  stepValue: 1,
                  iconSize: 25,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
