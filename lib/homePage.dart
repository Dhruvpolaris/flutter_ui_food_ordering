import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_ordering/tab_list.dart';
import './widgets/list_item.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 30.0,
                ),
                Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0))
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 20),
            child: Text(
              'SEARCH FOR',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w900, fontSize: 27.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 20),
            child: Text(
              'CUISINES',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w900, fontSize: 27.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 35.0,
              left: 20,
              right: 20,
            ),
            child: Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(15.0)),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.notoSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade700,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0, left: 20),
            child: Text(
              'Recommended',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w700, fontSize: 24.0),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(
                top: 15.0,
                left: 5,
                right: 20,
              ),
              height: 225.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ListItem(
                    'Hamburger',
                    'assets/burger.png',
                    '24',
                    Color(0xFFFFE9C6),
                    Color(0xFFDA9551),
                  ),
                  ListItem(
                    'French Fries',
                    'assets/fries.png',
                    '15',
                    Color(0xFFC2E3FE),
                    Color(0xFF6A8CAA),
                  ),
                  ListItem(
                    'Donuts',
                    'assets/doughnut.png',
                    '5',
                    Color(0xFFD7FADA),
                    Color(0xFF56CC7E),
                  ),
                ],
              )),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text('FEATURED'),
                ),
                Tab(
                  child: Text('COMBOS'),
                ),
                Tab(
                  child: Text('FAVORITES'),
                ),
                Tab(
                  child: Text('RECOMMENDED'),
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
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: _tabController,
              children: [
                TabList(),
                TabList(),
                TabList(),
                TabList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
