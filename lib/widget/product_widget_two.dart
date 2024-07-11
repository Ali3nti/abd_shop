import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class ProductWidgetTwo extends StatelessWidget {
  ProductWidgetTwo(
      {super.key,
      required this.picture,
      required this.productdetail,
      this.percent,
      this.onTap,
      required this.priceproduct});

  String picture;
  Text? percent;
  String productdetail;
  String priceproduct;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // There is a problem here and It does not work properly  //
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              picture,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                productdetail,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(right: 65),
              child: Row(
                children: [
                  Text(
                    priceproduct,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Image.asset(
                    "assets/images/toman.png",
                    width: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 6,
                      ),
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: percent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
