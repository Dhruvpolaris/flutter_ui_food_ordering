import 'package:flutter/material.dart';
import '../widgets/tab_item.dart';


class DetailAddOn extends StatefulWidget {
  @override
  _DetailAddOnState createState() => _DetailAddOnState();
}

class _DetailAddOnState extends State<DetailAddOn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TabItem('Sweet Cheese', '0', '11', 'assets/cheese.png'),
          TabItem('Sweet Popcorn', '0', '6', 'assets/popcorn.png')
        ],
      ),
    );
  }
}