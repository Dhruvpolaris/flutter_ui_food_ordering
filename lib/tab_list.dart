import 'package:flutter/material.dart';
import './widgets/tab_item.dart';

class TabList extends StatefulWidget {
  @override
  _TabListState createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TabItem('Delicious Hot Dog', '4', '6', 'assets/hotdog.png'),
          TabItem('Cheese pizza', '5', '12', 'assets/pizza.png')
        ],
      ),
    );
  }
}
