import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Spacer(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Burger Builder'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Checkout'),
            onTap: () {},
          ),
          Spacer(flex: 8),
        ],
      ),
    );
  }
}
