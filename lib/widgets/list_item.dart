import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_ordering/detail_screen.dart';

class ListItem extends StatelessWidget {
  @required
  final String name;
  @required
  final String imgUrl;
  @required
  final String price;
  @required
  final Color bgColor;
  @required
  final Color textColor;

  ListItem(this.name, this.imgUrl, this.price, this.bgColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(name, price, imgUrl, name)));
        },
        child: Container(
          height: 175.0,
          width: 130.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: name,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Image.asset(imgUrl, height: 50.0, width: 50.0),
                  ),
                ),
              ),
              SizedBox(height: 35.0),
              Text(
                name,
                style: GoogleFonts.notoSans(
                  fontSize: 20.0,
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '\$' + price,
                style: GoogleFonts.notoSans(
                  fontSize: 17.0,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
