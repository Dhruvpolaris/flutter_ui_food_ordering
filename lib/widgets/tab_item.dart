import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TabItem extends StatelessWidget {
  @required
  final String foodName;
  @required
  final String rating;
  @required
  final String price;
  @required
  final String imgPath;
  TabItem(this.foodName, this.rating, this.price, this.imgPath);
  @override
  Widget build(BuildContext context) {

    var _showRating = true;
    if(rating == '0')
    { 
      _showRating = false;
    }

    return Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 210.0,
                child: Row(children: [
                  Container(
                      height: 65.0,
                      width: 65.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: Color(0xFFFFE3DF)),
                      child: Center(
                          child:
                              Image.asset(imgPath, height: 45.0, width: 45.0))),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 125.0,
                        child: Text(
                          foodName,
                          style: GoogleFonts.notoSans(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      _showRating ? SizedBox(height: 3.0) :
                      SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (v) {},
                          starCount: int.parse(rating),
                          rating: double.parse(rating),
                          color: Color(0xFFFFD143),
                          borderColor: Color(0xFFFFD143),
                          size: 15.0,
                          spacing: 0.0),
                      SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$' + price,
                            style: GoogleFonts.lato(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w900,
                                textStyle: TextStyle(color: Color(0xFFF68D7F))),
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            '\$' + '18',
                            style: GoogleFonts.lato(
                                fontSize: 13.0,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w900,
                                textStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.6))),
                          )
                        ],
                      )
                    ],
                  )
                ])),
            FloatingActionButton(
              heroTag: foodName,
              mini: true,
              onPressed: () {},
              child: Center(child: Icon(Icons.add, color: Colors.white)),
              backgroundColor: Color(0xFFFE7D6A),
            )
          ],
        ));
  }
}
