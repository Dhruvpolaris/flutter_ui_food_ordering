import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/detail_add_on.dart';

class DetailScreen extends StatefulWidget {
  final String itemName;
  final String price;
  final String imgUrl;
  final String heroTag;

  DetailScreen(this.itemName, this.price, this.imgUrl, this.heroTag);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
 with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 1);
  }

  var netPrice = 0.0;
  var quantity = 1;
  var _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:20.0,bottom: 20,right: 20,left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Stack(
                  children: [
                    Container(
                        height: 45.0, width: 45.0, color: Colors.transparent),
                    Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(0xFFFE7D6A).withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0))
                      ], color: Color(0xFFFE7D6A), shape: BoxShape.circle),
                      child: Center(
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8, color: Color(0xFFFE7D6A)),
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                              fontSize: 7.0,
                              textStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 20),
            child: Text(
              'SUPER',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w900, fontSize: 27.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 20),
            child: Text(
              widget.itemName.toUpperCase(),
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w900, fontSize: 27.0),
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 175.0,
                  width: 175.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgUrl), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6.0,
                                spreadRadius: 6.0,
                                offset: Offset(5.0, 11.0),
                              ),
                            ]),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                            
                        child: Center(
                          child:
                          IconButton(
                            icon:  Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
                            color: Color(0xFFFE7D6A),
                            iconSize: 25.0,
                            onPressed: () {
                              _favoriteToggle(_isFavorite);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.restore,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 70.0,
                  width: 125.0,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    '\$' + (int.parse(widget.price) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                        fontSize: 40.0,
                        color: Color(0xFF5E6166),
                        fontWeight: FontWeight.w500),
                  ))),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                    color: Color(0xFFFE7D6A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        height: 40.0,
                        width: 105.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                iconSize: 17.0,
                                icon: Icon(Icons.remove,
                                    color: Color(0xFFFE7D6A)),
                                onPressed: () {
                                  adjustQuantity('MINUS');
                                }),
                            Text(
                              quantity.toString(),
                              style: GoogleFonts.notoSans(
                                  fontSize: 14.0,
                                  color: Color(0xFFFE7D6A),
                                  fontWeight: FontWeight.w400),
                            ),
                            IconButton(
                                iconSize: 17.0,
                                icon: Icon(Icons.add, color: Color(0xFFFE7D6A)),
                                onPressed: () {
                                  adjustQuantity('PLUS');
                                }),
                          ],
                        )),
                    Text(
                      'Add to cart',
                      style: GoogleFonts.notoSans(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text('Add-On'),
                ),
              ],
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                  fontSize: 18.0, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: _tabController,
              children: [
                DetailAddOn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _favoriteToggle(bool status){
    setState(() {
    status ? _isFavorite=false :_isFavorite=true;
    });
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
