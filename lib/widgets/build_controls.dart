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
          BuildControl()
        ],
      ),
    );
  }
}
